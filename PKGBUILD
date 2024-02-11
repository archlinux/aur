# Maintainer: KarmaTag <KarmaTag at proton dot me>
pkgname=sdrtrunk-git
pkgver=0.6.1
_pkgver=${pkgver}-beta-1
pkgrel=1
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR - Latest release'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${_pkgver//_/-}/sdr-trunk-linux-x86_64-v${_pkgver//_/-}.zip"
               "sdrtrunk.desktop"
               "cat-radio-icon.png")

source_aarch64=("${url}/releases/download/v${_pkgver//_/-}/sdr-trunk-linux-aarch64-v${_pkgver//_/-}.zip"
                "sdrtrunk.desktop"
                "cat-radio-icon.png")

b2sums_aarch64=('d3216fd9d1a88cfe160e5b08398cc2f25e7cb46e63a842d9098b8ceb85f06f27b02ceb7d4ff77813069be419b186047748f39a14086ceec0369ba9c323799db8'
                '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('4110d25736829627532da2466fe8658fbbe4d57e6f347b3940963d06b44cf403eef5086952fd2eb9d9a7b356abad07248b3b4deecda4b0ae4f2c932c551d838c'
               '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
               '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
    install -Dm644 cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver//_/-}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
