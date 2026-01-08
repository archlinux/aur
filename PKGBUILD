# Maintainer: ResRipper <resripper@connective.link>

# shellcheck disable=SC2034,SC2148,SC2154

pkgname=xyce-serial-bin
pkgver=7.10.0
_pkg_date=260108
pkgrel=1
pkgdesc="Open-source, SPICE-compatible, high-performance analog circuit simulator"
arch=(x86_64)
url='https://github.com/ResRipper/Xyce-Builder'
license=('GPL-3.0-or-later')
options=(!debug)

conflicts=(
    'xyce-shylu'
    'xyce-serial'
)

makedepends=(
    'tar'
    'zstd'
)

depends=(
    'blas-openblas'
    'gcc-libs'
    'fftw'
    'suitesparse'
)

optdepends=(
    # ADMS is no-longer activly maintained
    # For 'too many arguments to function verilogaparse' build error, check https://github.com/Qucs/ADMS/issues/115
    'adms: Convert Verilog-A models to C++ for Xyce'
)

source=(
    "xyce_${pkgver}-${_pkg_date}.tar.zst::https://github.com/ResRipper/Xyce-Builder/releases/download/Xyce-${pkgver}-${_pkg_date}/xyce_serial-${pkgver}.tar.zst"
)
sha256sums=(
    '4475cafa31932f57ad51e9d2a4f5f31d4c1711f87dc99cc3ee096d8dc46b5f55'
)

prepare() {
    # Already provided by ADMS
    rm "${srcdir}/bin/admsXml"
}

package() {
    mkdir -p "${pkgdir}/usr"
    mv "${srcdir}/bin" "${pkgdir}/usr/"
    mv "${srcdir}/include" "${pkgdir}/usr/"
    mv "${srcdir}/lib" "${pkgdir}/usr/"
    mv "${srcdir}/share" "${pkgdir}/usr/"
}