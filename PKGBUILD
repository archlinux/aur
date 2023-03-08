# Maintainer: K4YT3X <aur@k4yt3x.com>
# Maintainer: TobFromme
pkgname=sdrtrunk-bin
pkgver=0.5.2
pkgrel=1
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-x86_64-v${pkgver}.zip"
               "sdrtrunk.desktop")

source_aarch64=("${url}/releases/download/v${pkgver}/sdr-trunk-linux-aarch64-v${pkgver}.zip"
                "sdrtrunk.desktop")

b2sums_x86_64=('99b8b5cec0f5b500fbb5a311e5dc9a35f9bf37e218b65507806701ab07098e591b48ff8276e1dd91478230c85534f6fe0e81764d7222bc4e51b9de63ad2a6ae1'
               '8be385adc3a2772c18f77ef4ec2b44a8986010d80263c529c6676bf8565b3460a718a94fed8ec4a1b77775db02e40dd182ef6ec91ca4324f2638e8867cd31c81')

b2sums_aarch64=('fd8aa4489fb1734081788c5e198b849f82898bbf50ca12a95f0865c2913f68979967d15c2b81f3118e9fe8cf523b2e47443bc072a4a913d0d157514750ec7d9f'
                '8be385adc3a2772c18f77ef4ec2b44a8986010d80263c529c6676bf8565b3460a718a94fed8ec4a1b77775db02e40dd182ef6ec91ca4324f2638e8867cd31c81')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "${pkgdir}/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
