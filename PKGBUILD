# Maintainer: Alexis Polti <alexis@free.fr>
# Corrected by Nim65s <guilhem@saurel.me>
!
pkgname=nrf5x-command-line-tools
pkgver=10.9.0
pkgrel=0
pkgdesc="Tools for programming Nordic nRF51, nRF52 and nRF91 MCU using J-Link"
arch=('x86_64')
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools"
license=('custom')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
_source="https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/${pkgver//./-}/nRFCommandLineTools${pkgver//./}Linux"
source_x86_64=("${_source}amd64tar.gz")
md5sums_x86_64=('fadb5de042856d287eee973b2abaef61')

package() {
    cd ${srcdir}
    tar xf "nRF-Command-Line-Tools_${pkgver//./_}.tar"

    # Install nrfjprog and mergehex
    install -dm755 "${pkgdir}/opt/nrfjprog" "${pkgdir}/opt/mergehex"
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r --preserve=mode nrfjprog/* "${pkgdir}/opt/nrfjprog"
    cp --preserve=mode mergehex/* "${pkgdir}/opt/mergehex"
    cp --preserve=mode nrfjprog/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/nrfjprog/nrfjprog" "${pkgdir}/usr/bin"
    ln -s "/opt/mergehex/mergehex" "${pkgdir}/usr/bin"
}
