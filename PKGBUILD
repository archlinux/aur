# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-unstable-bin
pkgver=0.8.13
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
sha256sums=('2e4bbff6b7ecfa944d30a0cdd93dfa2d469c91265c856e8620256ca8becc45a6')
sha256sums_x86_64=('20ef3bd4bb37e8511f77d7786dea6848f97f8b96d4253fcf3f51cd2666ca2811')
sha256sums_aarch64=('9cec1bc6ac3ba374f69488000cd3b6218ae1f4c716c7f4ef3f4dab2b90822a9f')

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
