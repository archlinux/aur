# Maintainer: Florian Bigard <florian.bigard@gmail.com>

pkgname=libscrobbler
pkgver=1.0.8.r20.g15fc24a
pkgrel=1
pkgdesc="A fork of liblastfm which allow custom hosts"
arch=('i686' 'x86_64')
license=('GPL')
depends=('qt4>4.8' 'fftw' 'libsamplerate')
makedepends=( 'cmake' )
url="https://github.com/Chocobozzz/libscrobbler"

source=('git+https://github.com/Chocobozzz/libscrobbler')
sha256sums=('SKIP')

provides=('libscrobbler')
conflicts=('libscrobbler')
replaces=('libscrobbler')


pkgver() {
  cd libscrobbler
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  mkdir -p build
  cd build

  cmake ../libscrobbler \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DBUILD_WITH_QT4=ON \
    -DBUILD_TESTS=OFF

  make 
}

package(){
  cd build
  make DESTDIR=${pkgdir} install
}
