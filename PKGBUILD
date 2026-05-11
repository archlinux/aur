# Maintainer: Aleksei Aleinikov <alexey.aleynikov@telekom.com>
pkgname=clawsec
pkgver=2.8.2
pkgrel=1
pkgdesc="Encrypted netcat with SOCKS5, reverse tunnels, port scanning, and post-quantum crypto"
arch=('x86_64' 'aarch64')
url="https://github.com/LF3551/ClawSec"
license=('BSD')
depends=('openssl')
makedepends=('gcc' 'make')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/LF3551/ClawSec/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ed562f4fedef7fc6d7522c96d24c3e20dd74dac50b1833d5986099ee4c1100e3')

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
