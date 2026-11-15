# Maintainer: Aleksei Aleinikov <contact@alekseialeinikov.com>
pkgname=clawsec
pkgver=3.0.0
pkgrel=1
pkgdesc="Encrypted netcat with SOCKS5, reverse tunnels, port scanning, and post-quantum crypto"
arch=('x86_64' 'aarch64')
url="https://github.com/LF3551/ClawSec"
license=('BSD')
depends=('openssl' 'argon2' 'zlib')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LF3551/ClawSec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('da839d751181105feeb5cc069c5f667c7c4a72a9158548785092ea3cce66c8c1')

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
