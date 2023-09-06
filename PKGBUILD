# Maintainer: KarmaTag
pkgname=sdrtrunk-git
pkgver=0.6.0_beta_2
pkgrel=1
_pkgfile=0.6.0_beta2
pkgdesc='A cross-platform java application for decoding, monitoring, recording and streaming trunked mobile and related radio protocols using SDR - Latest release'
arch=('aarch64' 'x86_64')
url='https://github.com/DSheirer/sdrtrunk'
license=('GPL3')
depends=('at-spi2-core' 'libnet' 'alsa-lib' 'gtk3')
provides=('sdrtrunk')
conflicts=('sdrtrunk' 'sdrtrunk-git' 'sdrtrunk-bin')

source_x86_64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-x86_64-v${_pkgfile//_/-}.zip"
               "sdrtrunk.desktop")

source_aarch64=("${url}/releases/download/v${pkgver//_/-}/sdr-trunk-linux-aarch64-v${_pkgfile//_/-}.zip"
                "sdrtrunk.desktop")

b2sums_aarch64=('2e36de979a4d7c80acb82dd5a702dc3ffc9ee82cfed21ed62cd697f9112f0a50255f157b0002950122b7eaa0f5f832ee6b7bbcf8c9b46323e2d231a237cadb12'
                '7065fd1b01bbb39731571a07ed03b203b5f27ddf77f4fe58617747c87a753c7727642edf757d07bc489c4a80f54dfeb4dea74300fb81125adb04ace1af3ee9c2')
b2sums_x86_64=('62c663c9f8153d0fca0ec4dc9698dd400467a46d2a5cc81c9448cd55a8c3ce2c4675a5e0db66b41186e6ff57f60fdf242804e1b45f5110f30d83cb1c76b2717a'
               '7065fd1b01bbb39731571a07ed03b203b5f27ddf77f4fe58617747c87a753c7727642edf757d07bc489c4a80f54dfeb4dea74300fb81125adb04ace1af3ee9c2')

package() {
    install -Dm644 sdrtrunk.desktop "${pkgdir}/usr/share/applications/sdrtrunk.desktop"

    cd "sdr-trunk-linux-${CARCH}-v${pkgver}"
    mkdir -p "${pkgdir}/usr/share/sdrtrunk" "${pkgdir}/usr/bin"
    cp -ra * "${pkgdir}/usr/share/sdrtrunk"

    ln -s "/usr/share/sdrtrunk/bin/sdr-trunk" "${pkgdir}/usr/bin/sdr-trunk"
}
