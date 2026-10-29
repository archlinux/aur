# Maintainer: va2bbw <antelaurijssen@gmail.com>
pkgname=mercury-modem
pkgver=1.9.21
pkgrel=1
pkgdesc="Digital Radio OFDM HF modem protocol for ARQ data connections"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Rhizomatica/mercury"
license=('GPL-3.0-or-later')
depends=('alsa-lib' 'libpulse' 'hamlib' 'hidapi')
makedepends=('pkgconf')
backup=('etc/mercury/mercury.ini')
source=("${pkgname%-modem}-${pkgver}.tar.gz::https://github.com/Rhizomatica/mercury/archive/refs/tags/v${pkgver}.tar.gz")

build() {
    cd "mercury-${pkgver}"
    make
}

package() {
    cd "mercury-${pkgver}"

    # Main executable
    install -Dm755 mercury \
        "${pkgdir}/usr/bin/mercury"

    # Configuration
    install -Dm644 mercury.ini.example \
        "${pkgdir}/etc/mercury/mercury.ini"

    # Man page
    install -Dm644 mercury.1 \
        "${pkgdir}/usr/share/man/man1/mercury.1"

    # Documentation
    install -Dm644 README.md \
        "${pkgdir}/usr/share/doc/${pkgname}/README.md"

    # Main license
    install -Dm644 LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Third-party licenses
    install -Dm644 LICENSE-freedv \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-freedv"

    install -Dm644 common/iniparser/LICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-iniparser"

    install -Dm644 audioio/ffaudio/UNLICENSE \
        "${pkgdir}/usr/share/licenses/${pkgname}/UNLICENSE-ffaudio"
}
sha256sums=('785a84463581ba89420ff1a18b3f4ea88f92f2176fc13d16b899c1dbfdb883cd')
