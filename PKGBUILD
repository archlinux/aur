# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mmg-git
pkgver=5.7.0.2.ge04216d1
pkgrel=1
epoch=1
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.mmgtools.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('scotch')
makedepends=('cmake' 'netcdf' 'proj' 'qt5-base' 'glew' 'python' 'libogg' 'libtheora')
provides=('mmg3d' 'mmg')
conflicts=('mmg3d' 'mmg')
replaces=('mmg3d')
source=("git+https://github.com/MmgTools/mmg.git")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git describe --tags | cut -c2- | tr - .
}

build () {
  cd ${pkgname%-git}
  cmake -S . -B build \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DUSE_ELAS=OFF \
    -DUSE_VTK=OFF

  cmake --build build
}

package() {
  cd ${pkgname%-git}
  cmake --install build
}
