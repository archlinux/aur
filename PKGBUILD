# Maintainer: Davorin Učakar <davorin.ucakar@gmail.com>

pkgname=libsquish
pkgver=1.13
pkgrel=1
pkgdesc='DXT compression library'
depends=('gcc-libs')
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/libsquish/'
license=('MIT')
source=("http://downloads.sourceforge.net/project/libsquish/libsquish-${pkgver}.tgz")
md5sums=('ca4b9563953ad6ea9c43f7831a8c50c7')

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
  install -Dm 644 ../LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
