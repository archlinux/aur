# Maintainer: KarmaTag
pkgname=sdrtrunk-git
pkgver=0.6.0_beta_4
pkgrel=1
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR - Latest release'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-x86_64-v${pkgver//_/-}.zip"
               "sdrtrunk.desktop"
               "cat-radio-icon.png")

source_aarch64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-aarch64-v${pkgver//_/-}.zip"
                "sdrtrunk.desktop"
                "cat-radio-icon.png")

b2sums_aarch64=('fd63d1a9512d51cba430acf5823315691a9f4fa6f45022ec17e61b020c37dbe054f763c951eab1a5f3d59b889a3bb83d557ae962aa2afd01628dfc3bedc00a1c'
                '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('e580dbdf565606ebaadca206852d1213e457112e78a2ab8a0dc932b41520ee9d55e5175789ccf1546fb14929adfed7794709f95e097bde8b1408dd666af21689'
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
