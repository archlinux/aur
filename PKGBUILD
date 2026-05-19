# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-unstable-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="Asymmetric key generation and inspection tool for moshpit — X25519, P-384, P-256, and ML-DSA post-quantum identity keys (pre-compiled binary)"
arch=('x86_64')
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
sha256sums=('cadd920669cdefe0963d16bd63563b0e49e8d12ece45715f2797431f0630237c')
sha256sums_x86_64=('f4627be982d0b099e28098cfa1314afd2f52165e2e65aea3d50d5cab9b4a77c5')

package() {
    install -Dm755 mp-keygen-unstable-x86_64 "$pkgdir/usr/bin/mp-keygen"

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
