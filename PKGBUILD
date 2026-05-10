# Maintainer: Aleksei Aleinikov <alexey.aleynikov@telekom.com>
pkgname=clawsec
pkgver=2.8.1
pkgrel=1
pkgdesc="Encrypted netcat with SOCKS5, reverse tunnels, port scanning, and post-quantum crypto"
arch=('x86_64' 'aarch64')
url="https://github.com/LF3551/ClawSec"
license=('BSD')
depends=('openssl')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LF3551/ClawSec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('3e0529c71c51bb3901b9c1de86f0a99f9754802be5c3b4789edb31e99b454098')

build() {
    cd "ClawSec-${pkgver}/src"
    make -e clawsec \
        XFLAGS="" \
        XLIBS="-lssl -lcrypto -lstdc++ -lz"
}

package() {
    cd "ClawSec-${pkgver}"
    install -Dm755 src/clawsec "${pkgdir}/usr/bin/clawsec"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
