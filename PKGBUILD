# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname='cadabra2'
pkgver=2.2.7
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="http://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=('python' 'sqlite3' 'boost' 'gtkmm3')
makedepends=('cmake')
source=("https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('9baec68c52fca1e7bcda70448b8596f335ef004f4fc670a1def4721e6d8ac035')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake ..\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSQLITE3_INCLUDE_DIR=/usr/include
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR=$pkgdir install
  mv $pkgdir/usr/man $pkgdir/usr/share/$pkgname
}

