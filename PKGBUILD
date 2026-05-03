# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="ed25519 key generation and inspection tool for moshpit (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit-keygen')
conflicts=('moshpit-keygen')
depends=()
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp-keygen.tar.gz")
source_x86_64=("mp-keygen-x86_64::${_base}/mp-keygen-x86_64-unknown-linux-musl")
sha256sums=('7575f5612243c15b0f72676110ebf10972cb4e27660e08d5fb51f0d5345a5dbd')
sha256sums_x86_64=('7078fb06a64baa40ce2751af262c087bc49e4852f66656d2cb4680c6a5434db7')

package() {
    install -Dm755 mp-keygen-x86_64 "$pkgdir/usr/bin/mp-keygen"

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
