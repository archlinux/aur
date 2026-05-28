# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=barto-cli-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Barto command-line interface for querying bartos instances (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('barto-cli')
conflicts=('barto-cli')
depends=()
makedepends=()
install=barto-cli.install

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-barto-cli.tar.gz")
source_x86_64=("barto-cli-x86_64::${_base}/barto-cli-x86_64-unknown-linux-musl")
source_aarch64=("barto-cli-aarch64::${_base}/barto-cli-aarch64-unknown-linux-musl")
sha256sums=('13a592f48372a02be1241387bc0dca716eac4cbb323f6d477d18cfa6bab3f0fa')
sha256sums_x86_64=('804be4888bd7727f401cb24679d951fe2a8a4997438f2d3008950616f8a14d16')
sha256sums_aarch64=('87194e9784990c6586b4ceda404c887d5b4c2e2caa1cbe40d46b6ee34c4c3438')

package() {
    install -Dm755 "barto-cli-${CARCH}" "$pkgdir/usr/bin/barto-cli"

    # Man page
    install -Dm644 barto-cli/barto-cli.1 "$pkgdir/usr/share/man/man1/barto-cli.1"

    # Shell completions
    install -Dm644 barto-cli/barto-cli.bash \
        "$pkgdir/usr/share/bash-completion/completions/barto-cli"
    install -Dm644 barto-cli/_barto-cli \
        "$pkgdir/usr/share/zsh/site-functions/_barto-cli"
    install -Dm644 barto-cli/barto-cli.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/barto-cli.fish"

    # Example config
    install -Dm644 barto-cli/barto-cli.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/barto-cli.toml.example"

    # Licenses
    install -Dm644 barto-cli/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 barto-cli/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
