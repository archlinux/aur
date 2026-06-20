# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-unstable-bin
pkgver=0.9.3
pkgrel=1
pkgdesc="Asymmetric key generation and inspection tool for moshpit — X25519, P-384, P-256, and ML-DSA post-quantum identity keys (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-keygen')
conflicts=('moshpit-keygen' 'moshpit-keygen-bin')
replaces=('moshpit-keygen-bin')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp-keygen.tar.gz")
source_x86_64=("mp-keygen-unstable-x86_64::${_base}/mp-keygen-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mp-keygen-unstable-aarch64::${_base}/mp-keygen-unstable-aarch64-unknown-linux-musl")
sha256sums=('12d32481744233a654636e05736a422810eb63c78d9471c5cdeadb8e6c919138')
sha256sums_x86_64=('8a45ae7318b53c2d833cf776ac2a18f501b31095242f2299eb744ae4e665f27a')
sha256sums_aarch64=('182927150f3108d8efff68e1fe5a12cbcec37a73a284bf98ab7c303ead5b91b2')

package() {
    install -Dm755 "mp-keygen-unstable-${CARCH}" "$pkgdir/usr/bin/mp-keygen"

    # Man page
    install -Dm644 mp-keygen/mp-keygen.1 "$pkgdir/usr/share/man/man1/mp-keygen.1"

    # Shell completions
    install -Dm644 mp-keygen/mp-keygen.bash \
        "$pkgdir/usr/share/bash-completion/completions/mp-keygen"
    install -Dm644 mp-keygen/_mp-keygen \
        "$pkgdir/usr/share/zsh/site-functions/_mp-keygen"
    install -Dm644 mp-keygen/mp-keygen.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mp-keygen.fish"

    # Licenses
    install -Dm644 mp-keygen/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mp-keygen/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
