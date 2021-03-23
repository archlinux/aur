# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=libsquish
pkgver=1.15
pkgrel=2
pkgdesc='DXT compression library'
depends=('gcc-libs')
makedepends=('cmake')
arch=('i686' 'x86_64')
url='https://sourceforge.net/projects/libsquish/'
license=('MIT')
source=("http://downloads.sourceforge.net/project/libsquish/libsquish-${pkgver}.tgz")
sha256sums=('628796eeba608866183a61d080d46967c9dda6723bc0a3ec52324c85d2147269')

build() {
  rm -rf "$srcdir/build" && mkdir -p "$srcdir/build" && cd "$srcdir/build"

  cmake \
    -D CMAKE_BUILD_TYPE=Release \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D BUILD_SHARED_LIBS=ON \
    ..

  make
}

package() {
  cd "$srcdir/build"

  cmake -D CMAKE_INSTALL_PREFIX="$pkgdir/usr" -P cmake_install.cmake

  install -Dm 644 ../CMakeModules/FindlibSquish.cmake "$pkgdir/usr/share/cmake/Modules/FindlibSquish.cmake"
  install -Dm 644 ../LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
