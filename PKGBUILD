# Maintainer: josephgbr <rafael.f.f1@gmail.com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Gerardo Exequiel Pozzi <vmlinuz386@yahoo.com.ar>

pkgname=sudokuki
pkgver=1.2.2
pkgrel=2
pkgdesc="A free graphical sudoku game written in Java"
arch=('any')
url="http://sudokuki.sourceforge.net/"
license=('GPL3')
depends=('java-runtime')
makedepends=('java-environment')
options=('!emptydirs' '!libtool')
source=( "http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2")
md5sums=('b7e205cf978829ad638845190d3ebb2d')

prepare() {
  gendesk -f -n --pkgname "$pkgname" --pkgdesc "$pkgdesc" \
    --name 'Sudokuki' --categories 'Game;ArcadeGame'
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" noinst_libdir="" install

  # Install .desktop file
  install -Dm644 src/resources/files/net/jankenpoi/sudokuki/resources/images/logo.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  # Install a readme file
  install -Dm644 README "$pkgdir"/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
