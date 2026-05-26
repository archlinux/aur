# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=bartoc-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="Barto job executor client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/barto"
license=('MIT' 'Apache-2.0')
provides=('bartoc')
conflicts=('bartoc')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/barto/releases/download/v${pkgver}"

source=("${_base}/dist-bartoc.tar.gz")
source_x86_64=("bartoc-x86_64::${_base}/bartoc-x86_64-unknown-linux-musl")
source_aarch64=("bartoc-aarch64::${_base}/bartoc-aarch64-unknown-linux-musl")
sha256sums=('cf2f83dfd1d0422f7385c6f0b3ff0dbe8976393f446f4e9014478d3539d7bba7')
sha256sums_x86_64=('dfa75bb8ebc5d7796deac799f02669f30330958666404943202dd44f5096f8a0')
sha256sums_aarch64=('d5e05c0a260ae884ba5415c5c7abf1c693cfe031b9580b6f5b9d023ebc1e71a7')

package() {
    install -Dm755 "bartoc-${CARCH}" "$pkgdir/usr/bin/bartoc"

    # Man page
    install -Dm644 bartoc/bartoc.1 "$pkgdir/usr/share/man/man1/bartoc.1"

    # Shell completions
    install -Dm644 bartoc/bartoc.bash \
        "$pkgdir/usr/share/bash-completion/completions/bartoc"
    install -Dm644 bartoc/_bartoc \
        "$pkgdir/usr/share/zsh/site-functions/_bartoc"
    install -Dm644 bartoc/bartoc.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/bartoc.fish"

    # Systemd service
    install -Dm644 bartoc/bartoc.service \
        "$pkgdir/usr/lib/systemd/system/bartoc.service"

    # Example config
    install -Dm644 bartoc/bartoc.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/bartoc.toml.example"

    # Licenses
    install -Dm644 bartoc/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 bartoc/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
