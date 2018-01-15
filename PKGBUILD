# Maintainer: pingplug <pingplug@foxmail.com>
# Contributor: perlawk

pkgname=dlib
_pkgname=dlib
pkgver=19.8
pkgrel=2
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques."
arch=('x86_64')
url="http://www.dlib.net/"
license=('Boost Software License')
optdepends=('blas: for BLAS support'
            'cuda: for CUDA support'
            'cudnn: for CUDNN support'
            'giflib: for GIF support'
            'lapack: for LAPACK support'
            'libjpeg-turbo: for JPEG support'
            'libpng: for PNG support'
            'neon: for neon support'
            'sqlite: for sqlite support')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2)
sha512sums=('13d354e2e35c93c1b84bbc680e38cfe043199a18cb362426f21962a3d2eb116c86dd83af4eacd131e3749d3a4eadcf58a9db28133ec508de0c2a4cb3eb87dbf1')

build() {
    cd "${srcdir}"
    mkdir -p build && cd build
    cmake \
        -DCMAKE_INSTALL_PREFIX:PATH=/usr \
        -DCMAKE_INSTALL_LIBDIR:PATH=/usr/lib \
        -DBUILD_SHARED_LIBS:BOOL=ON \
        -DCUDA_HOST_COMPILER='/usr/bin/cc-6' \
        -DCMAKE_BUILD_TYPE=Release \
        "../${_pkgname}-${pkgver}"
    make
}

package() {
    cd "${srcdir}/build"
    make DESTDIR=${pkgdir} install
    install -Dm644 "../${_pkgname}-${pkgver}/dlib/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
