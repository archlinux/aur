# Maintainer: Alexander Kobel <a-kobel@a-kobel.de>

pkgname=librs
pkgver=3.1.0
pkgrel=1
pkgdesc="Real root isolation for univariate polynomials and systems of polynomial equations"
url="http://vegas.loria.fr/rs/"
arch=('i686' 'x86_64')
license=('custom: RS license')
depends=('glibc' 'gmp>=5' 'mpfr>=3' 'mpfi')
source=("http://vegas.loria.fr/rs/${pkgver}/${pkgname}_${pkgver}-${CARCH}_Linux.tar.xz"
        "http://vegas.loria.fr/rs/rslicense.txt")
sha256sums=($( [ ${CARCH} = i686 ] && echo '2b3164bf577147d200e0d6d38269c131f6401eb6dff648d611872a26f55eb998'; \
               [ ${CARCH} = x86_64 ] && echo 'f665eac972cad9116bc18c5dfbe0b5d5c3ee9e8c4b6a8ab4032dd533ab2675f2'; )
            'SKIP')

_incs=(# mpfi.h mpfi_io.h
       rs3_basic.h rs3_config.h rs3_fncts.h rs3_gc.h rs_exports.h rsversion.h)
_bins=(rs_ascii rs_ascii_mt)
_libs=(# libmpfi.a
       librs3.a librs3_mt.a librsexport.a librsexport_rs.a)

package() {
    cd ${srcdir}
    install -D -m644 rslicense.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    cd ${pkgname}_${pkgver}
    for _inc in ${_incs[@]}; do
        install -D -m644 include/${_inc} "${pkgdir}/usr/include/${_inc}"
    done

    cd ${CARCH}_Linux
    for _bin in ${_bins[@]}; do
        install -D -m755 bin/${_bin} "${pkgdir}/usr/bin/${_bin}"
    done
    for _lib in ${_libs[@]}; do
        install -D -m644 lib/${_lib} "${pkgdir}/usr/lib/${_lib}"
    done
}
