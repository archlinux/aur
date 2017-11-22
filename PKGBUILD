# Maintainer: Robert Bragg <robert@sixbynine.org>

pkgname=libdlib
pkgver=19.7
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64' 'i686')
url="http://www.dlib.net/"
license=('Boost Software License')
makedepends=('cmake')
depends=('glibc')
optdepends=('blas: for BLAS support'
            'cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
conflicts=('dlib')
source=(https://sourceforge.net/projects/dclib/files/dlib/v${pkgver}/dlib-${pkgver}.tar.bz2)
sha256sums=('825dbe45e0d379a4e5584c2918b1e0cb37e9ed75657766fd7b2b4f3e05f892d6')

prepare() {
  cd "${srcdir}/dlib-${pkgver}"

  mkdir -p build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
}

build() {
  cd "${srcdir}/dlib-${pkgver}/build"
  make
}

package() {
  cd "${srcdir}/dlib-${pkgver}/build"
  make DESTDIR=${pkgdir} install

  install -Dm644 ../dlib/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
