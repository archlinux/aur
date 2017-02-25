# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=19.3
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-lapack: for BLAS and LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(https://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib-${pkgver}.patch)
sha256sums=('9c65bb3172e2e84cd194ab77d6096fd5c0574d9c67fb5176f5f884b3d540de3d'
            '700f0f580fe835df81fb243083f86d43a2e7a87d48f4367332b5e0b07a01d842')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}

    # fix can't find blas and lapack
    # fix a linking error while build a static binary with libpng
    patch -Np0 -i dlib-${pkgver}.patch
}

package() {
    for _arch in ${_architectures}; do
        cd "${srcdir}/${_pkgname}-${pkgver}"

        install -Dm755 -d "${pkgdir}/usr/${_arch}/include"
	    cp -a ${_pkgname} "${pkgdir}/usr/${_arch}/include"
    done
}
