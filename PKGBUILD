# Maintainer: Rob Cohen <rob@robcohen.dev>
pkgbase=rustledger-bin
pkgname=(rustledger-bin)
pkgver=0.16.5
pkgrel=1
pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustledger/rustledger"
license=('GPL-3.0-only')
depends=('glibc' 'libgcc')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/rustledger/rustledger/v${pkgver}/LICENSE")
source_x86_64=("${pkgbase}-${pkgver}-x86_64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${pkgbase}-${pkgver}-aarch64.tar.gz::https://github.com/rustledger/rustledger/releases/download/v${pkgver}/rustledger-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('SKIP')
sha256sums_x86_64=('d24b03ef8709969e991331ef706e1346ee7cec3787757e72e3247840e16b59f8')
sha256sums_aarch64=('7f80495c4b6a62cfba1d4a4e61157b9f608bb549160140c75da673b162dcc824')

package_rustledger-bin() {
    pkgdesc="Fast, pure Rust implementation of Beancount double-entry accounting (pre-built binary)"
    provides=("rustledger=$pkgver")
    conflicts=('rustledger')

    # Install main binaries
    install -Dm755 rledger "$pkgdir/usr/bin/rledger"
    install -Dm755 rledger-lsp "$pkgdir/usr/bin/rledger-lsp"

    # Install shell completions
    install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/rledger" < <(./rledger completions bash)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_rledger" < <(./rledger completions zsh)
    install -Dm644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/rledger.fish" < <(./rledger completions fish)

    # Install license
    install -Dm644 "LICENSE-${pkgver}" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# bean-* compatibility wrappers can be installed post-install via:
#   rledger compat install --prefix /usr/bin
