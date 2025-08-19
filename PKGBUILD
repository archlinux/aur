# Maintainer: KarmaTag <KarmaTag at proton dot me>
pkgname=sdrtrunk-git
pkgver=0.6.1
_pkgver=${pkgver}
pkgrel=3
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

b2sums_aarch64=('7d67d4b5e77b649714335acdf74d76727a87ee899585c6b7038b712858ecbb779abce39ae0a25bf3d58425d2774d96572fc66f6f3009652abbb480fa31bc2cc8'
                '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('36a1b31b18ee14cc4df0472ff04fc199864e0d69f34f86908e8e0a35d57793f2c2388e214e9b6fa29237c9b8f18f04b96d908975da8e268a3c9503ff108a1455'
               '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
               '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"
    install -Dm644 cat-radio-icon.png "${pkgdir}/usr/share/pixmaps/cat-radio-icon.png"

    cd "sdr-trunk-linux-${CARCH}-v${_pkgver//_/-}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
