# Maintainer: KarmaTag <KarmaTag at proton dot me>
pkgname=sdrtrunk-git
pkgver=0.6.0
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

b2sums_aarch64=('e6a8188b3a35331849cef6ad42947099918a47ad8a2b5f78cc326f5beb4e95f891ce92b5db8d6f44ea89ac8ee3c6637c0522e4a0465a6412edd450f72232203a'
                '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('c5094d3d46f56e188ed9a3e21a2445ff12cc8a7afa439f386d4b717b80f058e299d4e2db028a02abb8a3226cd2623bc80e12e9d46670a15609b22658de1823f1'
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
