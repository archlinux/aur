# First maintainer: Hal Clark
# Now maintained by: Paolo Zaffino (p.zaffino@unicz.it)
# Plastimatch PI: Greg Sharp

pkgname=plastimatch
pkgver=1.10.0
pkgrel=1
pkgdesc='Tools for medical image reconstruction and registration.'
arch=('i686' 'x86_64')
url='http://plastimatch.org/'
license=('BSD-style')
conflicts=('plastimatch-static')
replaces=('plastimatch-static')
depends=('insight-toolkit' 'dcmtk' 'libpng' 'zlib' 'libtiff' 'libjpeg-turbo' 'fftw')
makedepends=('cmake')
optdepends=('cuda')

source=("https://gitlab.com/plastimatch/plastimatch/-/archive/${pkgver}/plastimatch-${pkgver}.tar.bz2")
md5sums=('92160912a3b3297e1190ef79f62413bd')
sha1sums=('a3bc5b9869d716e8626d7c255ce67b48e475e7a4')

build() {
    cd "${srcdir}"
    rm -rf build
    mkdir build
    cd build

    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DBUILD_TESTING:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DPLM_CONFIG_ENABLE_CUDA=OFF \
      ../plastimatch-${pkgver}/

    make
}

package() {
    cd "${srcdir}"/build/
    make DESTDIR="${pkgdir}" install
}

