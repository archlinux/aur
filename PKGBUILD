# Maintainer: Alexis Polti <alexis@free.fr>
# Corrected by Nim65s <guilhem@saurel.me>
# Corrected with a smile by CvR_XX <info@carlosvanrooijen.nl>

pkgname=nrf5x-command-line-tools
_pkgname=nrf-command-line-tools
pkgver=10.15.0
pkgrel=0
pkgdesc="Tools for programming Nordic nRF51, nRF52 and nRF91 MCU using J-Link"
arch=('x86_64')
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools"
license=('custom')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_x86_64=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/${pkgver//./-}/${_pkgname}-${pkgver}_amd.zip")
sha256sums_x86_64=('e30b1c94508afe70ea3ad5eefb6b9914ee70b9dce17f14412bcbbb53d1aad9bd')

package() {
    cd ${srcdir}
    tar zxf "${_pkgname}-${pkgver}_Linux-amd64.tar.gz"

    mkdir -p "${pkgdir}/opt"
    cp -r "${_pkgname}" "${pkgdir}/opt/${pkgname}"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/nrfjprog" "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/bin/mergehex" "${pkgdir}/usr/bin"

    install -D ${_pkgname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
