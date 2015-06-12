# Maintainer: pingplug <pingplug@foxmail.com>

pkgname=mingw-w64-dlib
_pkgname=dlib
pkgver=18.16
pkgrel=1
pkgdesc="Dlib is a general purpose cross-platform C++ library designed using contract programming and modern C++ techniques. (mingw-w64)"
arch=('any')
url="http://www.dlib.net/"
license=('Boost Software License')
depends=('mingw-w64-crt')
optdepends=('mingw-w64-cblas: for BLAS support'
            'mingw-w64-lapack: for LAPACK support'
            'mingw-w64-libjpeg: for JPEG support'
            'mingw-w64-libpng: for PNG support'
            'mingw-w64-sqlite: for sqlite support')
options=('!buildflags' '!strip' 'staticlibs')
source=(http://downloads.sourceforge.net/project/dclib/${_pkgname}/v${pkgver}/${_pkgname}-${pkgver}.tar.bz2
        dlib-${pkgver}.patch)
md5sums=('e9e5449bc25370afce2d254327afac99'
         '87d1e10b4dc52960a4508264ce842602')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
    cd ${srcdir}

    # fix the windres flag
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
