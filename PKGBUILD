# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-bin
pkgver=0.8.5
pkgrel=1
pkgdesc="Asymmetric key generation and inspection tool for moshpit (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-keygen')
conflicts=('moshpit-keygen')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp-keygen.tar.gz")
source_x86_64=("mp-keygen-x86_64::${_base}/mp-keygen-x86_64-unknown-linux-musl")
source_aarch64=("mp-keygen-aarch64::${_base}/mp-keygen-aarch64-unknown-linux-musl")
sha256sums=('80843183558ee99f0384b600899431e5e22a9941ef7916c886953a1e118afafa')
sha256sums_x86_64=('2933a6f437d40ee7a11c70259665639ef723da0b15403c9a25e1ae0ffa99b520')
sha256sums_aarch64=('87ba8f89e4afa48f7bbff0757222efb8b68baeb22875aec4960431d78df50168')

package() {
    install -Dm755 "mp-keygen-${CARCH}" "$pkgdir/usr/bin/mp-keygen"

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
