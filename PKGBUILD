# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=gerbil
pkgver=1.0b
pkgrel=1
pkgdesc="An interactive visualization tool targeted at multispectral and hyperspectral image data"
arch=(i686 x86_64)
url="http://www.gerbilvis.org/"
license=('GPL3')
depends=('boost-libs' 'opencv' 'qt4' 'gdal')
makedepends=('boost' 'cmake')
install="$pkgname.install"
source=("http://files.gerbilvis.org/dl/gerbil-$pkgver-src.tar.bz2"
        "$pkgname.desktop")
md5sums=('c4f97dddbae4fa4ae355c8bb5f2bd9fa'
         '95c325def4edada78a7841429ec19aa8')

prepare() {
  cd $pkgname-$pkgver
  [ -d b ] || mkdir b
}

build() {
  cd $pkgname-$pkgver/b
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_BUILD_TYPE=Release \
           -DCMAKE_SKIP_RPATH=1
  make
}

package() {
  cd $pkgname-$pkgver/b

  # cli
  install -Dm755 bin/$pkgname \
    "$pkgdir/usr/bin/$pkgname"

  # qt4 gui
  install -Dm755 bin/q$pkgname \
    "$pkgdir/usr/bin/q$pkgname"

  # desktop file
  install -Dm644 "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"

  # icon
  install -Dm644 ../gui/resources/logo/icon.png \
    "$pkgdir/usr/share/pixmaps/q$pkgname.png"
}
