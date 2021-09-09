# Maintainer: Alexis Polti <alexis@free.fr>
# Corrected by Nim65s <guilhem@saurel.me>
# Corrected with a smile by CvR_XX <info@carlosvanrooijen.nl>

pkgname=nrf5x-command-line-tools
pkgver=10.14.0
pkgrel=0
pkgdesc="Tools for programming Nordic nRF51, nRF52 and nRF91 MCU using J-Link"
arch=('x86_64')
url="https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Command-Line-Tools"
license=('custom')
depends=('jlink-software-and-documentation')
provides=('nrfjprog')
conflicts=('nrfjprog')
options=()
source_x86_64=("https://www.nordicsemi.com/-/media/Software-and-other-downloads/Desktop-software/nRF-command-line-tools/sw/Versions-10-x-x/${pkgver//./-}/nRF-Command-Line-Tools_${pkgver//./_}_Linux64.zip")
md5sums_x86_64=('8a049bacc67519561b77e014b652d5df')

package() {
    cd ${srcdir}/nRF-Command-Line-Tools_${pkgver}_Linux64
    tar zxf "nRF-Command-Line-Tools_${pkgver}_Linux-amd64.tar.gz"
    tar xf "nRF-Command-Line-Tools_${pkgver}.tar"

    # Install nrfjprog and mergehex
    install -dm755 "${pkgdir}/opt/nrfjprog" "${pkgdir}/opt/mergehex"
    install -dm755 "${pkgdir}/usr/bin" "${pkgdir}/usr/share/licenses/${pkgname}"

    cp -r --preserve=mode nrfjprog/* "${pkgdir}/opt/nrfjprog"
    cp --preserve=mode mergehex/* "${pkgdir}/opt/mergehex"
    cp --preserve=mode nrfjprog/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    ln -s "/opt/nrfjprog/nrfjprog" "${pkgdir}/usr/bin"
    ln -s "/opt/mergehex/mergehex" "${pkgdir}/usr/bin"
}
