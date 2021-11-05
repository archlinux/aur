# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=mmg
pkgver=5.6.0
pkgrel=1
pkgdesc='Anisotropic tetrahedral remesher and moving mesh generator'
url="http://www.mmgtools.org/"
license=('GPL')
arch=('i686' 'x86_64')
depends=('scotch')
makedepends=('cmake' 'netcdf' 'proj' 'qt5-base' 'glew' 'python' 'libogg' 'libtheora')
provides=('mmg3d')
conflicts=('mmg3d')
replaces=('mmg3d')
source=("$pkgname-$pkgver.tar.gz::https://github.com/MmgTools/mmg/archive/v$pkgver.tar.gz"
	cmake.patch)
sha256sums=('bbf9163d65bc6e0f81dd3acc5a51e4a8c47a7fdae849abc26277e01154fe2437'
            '9716e5a64f577fdb08c25bc5d1eb73ff7bf32607e04719d78b247e4136bbcf15')

prepare () {
  cd "$pkgname-$pkgver"
  patch -Np1 < "$srcdir"/cmake.patch
}

build () {
  cmake -S "$srcdir/$pkgname-$pkgver" -B build \
    -DCMAKE_INSTALL_PREFIX="$pkgdir"/usr \
    -DBUILD_SHARED_LIBS=ON \
    -DUSE_ELAS=OFF \
    -DUSE_VTK=OFF

  cmake --build build
}

package() {
  cmake --install build
}
