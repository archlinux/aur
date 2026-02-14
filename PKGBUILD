# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgname=rustledger-bin
pkgver=0.8.7
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
provides=('rustledger' 'rledger')
conflicts=('rustledger')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rustledger/rustledger/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('f80eac46cd3da3d4d4c8b56ec704116209fe5ab463f6edccca9dfd26dd1ece17')
sha256sums_aarch64=('63f2c1fa98c0d4a1b457ccca9a4b6d57503306cf98905aec29f30d2e1c1bccba')

package() {
    cd "$srcdir"

    # Install main binaries
    install -Dm755 rledger "$pkgdir/usr/bin/rledger"
    install -Dm755 rledger-lsp "$pkgdir/usr/bin/rledger-lsp"

    # Install beancount compatibility binaries
    for bin in bean-check bean-format bean-query bean-report bean-doctor bean-extract bean-price; do
        if [[ -f "$bin" ]]; then
            install -Dm755 "$bin" "$pkgdir/usr/bin/$bin"
        fi
    done

    # Install license
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
