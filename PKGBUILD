# Maintainer: Aleksei Aleinikov <contact@alekseialeinikov.com>
pkgname=clawsec
pkgver=4.1.0
pkgrel=1
pkgdesc="Encrypted netcat with SOCKS5, reverse tunnels, port scanning, and post-quantum crypto"
arch=('x86_64' 'aarch64')
url="https://github.com/LF3551/ClawSec"
license=('BSD')
depends=('openssl' 'argon2' 'zlib')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LF3551/ClawSec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('fe925cbe46818420d53219b83142b3f1d7fa121f1b03fb328deb2e87e033d89a')

build() {
    cd "ClawSec-${pkgver}/src"
    make -e clawsec \
        XFLAGS="" \
        XLIBS="-lssl -lcrypto -largon2 -lstdc++ -lz"
}

package() {
    cd "ClawSec-${pkgver}"
    install -Dm755 src/clawsec "${pkgdir}/usr/bin/clawsec"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
