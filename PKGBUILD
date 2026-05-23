# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-unstable-bin
pkgver=0.8.7
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
sha256sums=('dd5db96f9fbd7e4b269c9c7cc9e41512192eba04520f7407364123db838511b2')
sha256sums_x86_64=('63cf0bbe34c1f7c7953d68dbb22a51ecf002b4b07e86cd24006f85565d268b1d')
sha256sums_aarch64=('e0f78a289a9df3943e1357d25cbc6bff6dcb8ca771bd6995722d3bd9961f4e8e')

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
