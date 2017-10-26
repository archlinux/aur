# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=19.7
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-giflib: for GIF support'
            'mingw-w64-lapack: for BLAS and LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib.patch)
sha256sums=('825dbe45e0d379a4e5584c2918b1e0cb37e9ed75657766fd7b2b4f3e05f892d6'
            'cf3d6d25f8785ccb636176c0af1a1d7fe4d53df445be658c8addfa9369eb1ba2')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}

    # fix a linking error while build a static binary with libpng
    # do not use CUDA
    patch -Np0 -i dlib.patch
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}"

        install -Dm755 -d "${pkgdir}/usr/${_arch}/include"
	    cp -a ${_pkgname} "${pkgdir}/usr/${_arch}/include"
    done
}
