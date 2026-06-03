# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=barto-cli-bin
pkgver=1.5.5
pkgrel=1
pkgdesc="Barto command-line interface for querying bartos instances (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('barto-cli')
conflicts=('barto-cli')
depends=()
makedepends=()
options=(!strip !debug)
install=barto-cli.install

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-barto-cli.tar.gz")
source_x86_64=("barto-cli-x86_64::${_base}/barto-cli-x86_64-unknown-linux-musl")
source_aarch64=("barto-cli-aarch64::${_base}/barto-cli-aarch64-unknown-linux-musl")
sha256sums=('4bd697a5678be9f92842e359e3449da4cb12ac6a699c588aa6003868cb549a5b')
sha256sums_x86_64=('82869ed5b14e9abb774daa2e30cad9120cf136c92bcdc2b4658fe9adb34aa1d7')
sha256sums_aarch64=('08f2990ae8de9c2221b0bf57830b1d7e6371abb5f67f949604bad6f3d5fc0ec2')

package() {
    # Real binary (invoked by the launcher)
    install -Dm755 "barto-cli-${CARCH}" "$pkgdir/usr/lib/barto-cli/barto-cli"

    # Launcher script (reads keychain secrets, exports as env vars)
    install -Dm755 "barto-cli/barto-cli-launcher" "$pkgdir/usr/bin/barto-cli"

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

    # Documentation
    install -Dm644 barto-cli/README.md "$pkgdir/usr/share/doc/$pkgname/README.md"

    # Licenses
    install -Dm644 barto-cli/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 barto-cli/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
