# Maintainer: Alexis Polti <alexis@free.fr>
# Corrected by Nim65s <guilhem@saurel.me>
# Corrected with a smile by CvR_XX <info@carlosvanrooijen.nl>

pkgname=nrf5x-command-line-tools
pkgver=10.12.2
pkgrel=2
pkgdesc="Tools for programming Nordic nRF51, nRF52 and nRF91 MCU using J-Link"
arch=('x86_64')
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools"
license=('custom')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
_source="https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/${pkgver//./-}/nRF-Command-Line-Tools_${pkgver//./_}_Linux-"
source_x86_64=("${_source}amd64.zip")
md5sums_x86_64=('f70bee8805f7bb2f93063c67d197a0d0')

# https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/10-12-2/nRF-Command-Line-Tools_10_12_2_Linux-amd64.zip

package() {
    cd ${srcdir}/nRF-Command-Line-Tools_10_12_2_Linux-amd64
    tar zxf "nRF-Command-Line-Tools_10_12_2_Linux-amd64.tar.gz"
    tar xf "nRF-Command-Line-Tools_10_12_2.tar"

    # Install nrfjprog and mergehex
    install -dm755 "${pkgdir}/opt/nrfjprog" "${pkgdir}/opt/mergehex"
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r --preserve=mode nrfjprog/* "${pkgdir}/opt/nrfjprog"
    cp --preserve=mode mergehex/* "${pkgdir}/opt/mergehex"
    cp --preserve=mode nrfjprog/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/nrfjprog/nrfjprog" "${pkgdir}/usr/bin"
    ln -s "/opt/mergehex/mergehex" "${pkgdir}/usr/bin"
}
