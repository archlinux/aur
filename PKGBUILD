# Maintainer: Matej Lach <matej.lach@gmail.com>
# Contributor: kitech1 <vatic@vivaldi.net>
pkgname=edrawmax
pkgver=9.3
pkgrel=3
pkgmaver=9
pkgmaname=EdrawMax
epoch=
pkgdesc="All-in-One Diagram Software"
arch=('x86_64')
url="http://www.edrawsoft.cn/edrawmax/"
license=('custom:"Copyright EdrawSoft 2004-2018; All Rights Reserved."')
groups=()
depends=(qt5-base)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!strip)
install=
changelog=
source=(https://www.edrawsoft.com/archives/$pkgname-$pkgmaver-amd64.tar.gz edrawmax.desktop)
sha256sums=('4ddc489dad1cd663a85ac91b5fe9c3263ae58aedbbcaaa690d7737d9b53e68eb' 
'b0369cd8b8e2d3826f3bdc3362d6c18b9fdcbfa064625d823bd424c0d83b6b1e')
noextract=()

build() {
  echo "Extracting files..."
  tar zxf $pkgname-$pkgmaver-amd64.tar.gz
  rm -f $pkgname-$pkgmaver-amd64.tar.gz
}

check() {
  cd "$srcdir/$pkgname-$pkgmaver-amd64"
}

package() {
  cd "$srcdir/$pkgname-$pkgmaver-amd64"
  mkdir -p "$pkgdir/opt/$pkgmaname-$pkgmaver"
  mv * "$pkgdir/opt/$pkgmaname-$pkgmaver/"

  cd "$pkgdir/opt/$pkgmaname-$pkgmaver"
  mkdir -p $pkgdir/usr/share/applications/
  mkdir -p $pkgdir/usr/share/mime/packages/
  mkdir -p $pkgdir/usr/share/icons/gnome/scalable/mimetypes/
  mkdir -p $pkgdir/usr/bin/
  cp -f edrawmax.png $pkgdir/usr/share/icons/
  cp -f edrawmax.xml $pkgdir/usr/share/mime/packages/
  cp -f eddx.svg $pkgdir/usr/share/icons/gnome/scalable/mimetypes/
  cp -f $srcdir/edrawmax.desktop $pkgdir/usr/share/applications/
  ln -f -s /opt/$pkgmaname-$pkgmaver/$pkgmaname $pkgdir/usr/bin/edrawmax
}

post_install() {
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/gnome/ -f
  ldconfig
}

post_upgrade() {
  update-desktop-database /usr/share/applications
  update-mime-database /usr/share/mime
  gtk-update-icon-cache /usr/share/icons/gnome/ -f
  ldconfig
}

# vim:set ts=2 sw=2 et:
