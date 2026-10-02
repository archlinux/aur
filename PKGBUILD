# Maintainer: Leone <comdir@infonix.info>
pkgname=yd-go
pkgver=b388f813
pkgrel=1
epoch=
pkgdesc="Panel indicator for Yandex-disk CLI daemon (linux)"
arch=('x86_64')
url="https://github.com/slytomcat/yd-go"
license=('GPL-3.0-only')
groups=()
depends=("yandex-disk")
makedepends=("gendesk")
checkdepends=()
optdepends=()
provides=()
conflicts=("yd-go-git")
#replaces=()
#backup=()
options=('!strip' '!debug')
install=
changelog=
source=("https://github.com/slytomcat/yd-go/releases/download/master-${pkgver}/yd-go"
yd-go.png)

#noextract=()
b2sums=('bd61a3802b773dd853f119d391f78641647844ff99d9ee21258668691ad78fcc3a6ee05a71731a60f24333d8722d34d86ecf8d203c42a3a5f8f09a8dd5b19d76'
        '647865327ba584fdc36ddc37e85b6457af6ca888d1b25479a7b8a94a81d0629a71c954a21c8604ef5e96c529178fcf9c4b6fd82df41a1ab6a9ab2d5c281c2c41')


validpgpkeys=()

prepare() {
	
  echo "Creating desktop file"
  gendesk -f -n --pkgname ${pkgname} \
    --pkgdesc "${pkgdesc}" \
    --categories="GTK;GNOME;X-GNOME-NetworkSettings;Network;" \
    --icon "/usr/share/pixmaps/${pkgname}.png" \
    --exec "yd-go"
	
}

package() {
  install -Dm755 "${srcdir}/yd-go" "${pkgdir}/opt/yd-go/yd-go"
  mkdir -p "${pkgdir}/usr/bin"
 # ln -s "/opt/yd-go/yd-go" "${pkgdir}/usr/bin/yd-go"
  install -Dm644 "${srcdir}/yd-go.desktop" "${pkgdir}/usr/share/applications/yd-go.desktop"
  install -Dm644 "${srcdir}/yd-go.png" "${pkgdir}/usr/share/pixmaps/yd-go.png"
}

post_install() {
  cd /usr/bin
  ln -s /opt/ya-go/yd-go yd-go
}
