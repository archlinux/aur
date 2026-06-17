# Maintainer: François Guerraz <kubrick@fgv6.net>

pkgname=payetools-rti
pkgver=26.1.26134.173934
pkgrel=1
pkgdesc="UK HMRC Basic PAYE Tools for Linux"
arch=('x86_64')
url="https://www.gov.uk/basic-paye-tools"
license=('custom')
groups=()
depends=()
makedepends=('unzip')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip !debug)
changelog=
source=(
	"https://www.gov.uk/government/uploads/uploaded/hmrc/$pkgname-$pkgver-linux.zip" 
	)
noextract=( "$pkgname-$pkgver-linux.zip" )
sha256sums=('78948b59c305f9bf8dca2541480beb37ae35ca0edecfa371681670ae5f92de85')

prepare() {
  unzip -o "$pkgname-$pkgver-linux.zip"
  ./Basic_PAYE_Tools-${pkgver}-x86_64.AppImage --appimage-extract > /dev/null
}

build() {
  sed -i "s#Exec=.*#Exec=/opt/HMRC/basic-paye-tools/usr/bin/bptshell#g" "${srcdir}/squashfs-root/Basic PAYE Tools.desktop"
  sed -i "s#Icon=.*#Icon=/opt/HMRC/basic-paye-tools/usr/share/icons/hicolor/scalable/apps/bptshell.svg#g" "${srcdir}/squashfs-root/Basic PAYE Tools.desktop"

}

package() {
  install -d ${pkgdir}/opt/HMRC/basic-paye-tools
  cp -fr ${srcdir}/squashfs-root/usr ${pkgdir}/opt/HMRC/basic-paye-tools/
  install -D -t ${pkgdir}/usr/share/licenses/payetools-rti/ ${srcdir}/squashfs-root/usr/bptserver/license.txt
  install -D -t ${pkgdir}/usr/share/applications/ ${srcdir}/squashfs-root/Basic\ PAYE\ Tools.desktop
}
