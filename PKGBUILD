# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=cadabra2
pkgver=2.3.6.8
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="http://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=('python-sympy' 'sqlite' 'boost' 'gtkmm3' 'jsoncpp' 'xeus')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('6c23ff53b8d882c9bfd3df6480525d6b8ab54c9ba0bf876aacb8b842d09ec11b')

prepare() {
  mkdir -p "$srcdir/build"
}

build() {
  cd "$srcdir/build"
  cmake ../$pkgname-$pkgver \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSQLITE3_INCLUDE_DIR=/usr/include \
        -DENABLE_JUPYTER=ON \
        -DENABLE_SYSTEM_JSONCPP=ON
  make
}

check() {
  cd "$srcdir/build"
  make test
}

package() {
  cd "$srcdir/build"
  make DESTDIR="$pkgdir" install
}

