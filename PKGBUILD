# Maintainer: KarmaTag
pkgname=sdrtrunk-git
pkgver=0.6.0_beta_3
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

b2sums_aarch64=('a1808f0b437ac554fb409562005fdabf5f0401b9e7269e68bed65eaf6073d0adeeed4ebc8061dae79e1e92eb5e28931a7cb8f54441cca3dd32a4a90e2cec9f66'
                '285dd613bb7fde41201ebd5be90238d2ec4e7cca8e3b1ef7b1afe5d1be34427136d85216aa67ee94d259bf555292336fabe20e72c94422eca22ea02850d4d9b2'
                '6944037e19492f787ff624b40768c7a0158500bc0082721f0e14c9b3a0f1cebd68913be29498415258978c7cdecf58ee1da324d99a7a9b256f638e4614f1c7b8')
b2sums_x86_64=('efd392f02d4029c15dc65e7aa221e5600aefd3f7fe773cc03c799e840ea45b7de9b6866ee4e26433e5116bc473ecc19c56542752139fa4a851f6cf0a5df10dbc'
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
