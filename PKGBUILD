# Maintainer: Anton Kudelin <kudelin at protonmail dot com>
# Contributor: Tarn Burton <twburton at gmail dot com>

pkgname=cadabra2
pkgver=2.3.0
pkgrel=1
pkgdesc="A field-theory motivated approach to computer algebra"
arch=('x86_64')
url="http://cadabra.science"
license=('GPL')
conflicts=('cadabra2-git')
depends=('python' 'sqlite3' 'boost' 'gtkmm3' 'jsoncpp' 'xeus')
makedepends=('cmake')
source=($pkgname-$pkgver.tar.gz::"https://github.com/kpeeters/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('1ba2dd2c91e6678a49a136c181da4ec424f1cec9a7172cf95fd1b0c04c253217')

build() {
  cd $pkgname-$pkgver
  mkdir -p build
  cd build
  cmake ..\
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSQLITE3_INCLUDE_DIR=/usr/include \
        -DENABLE_JUPYTER=ON \
        -DENABLE_SYSTEM_JSONCPP=ON
  make
}

package() {
  cd $pkgname-$pkgver/build
  make DESTDIR="$pkgdir" install
}

