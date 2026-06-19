# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-bin
pkgver=0.9.2
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
sha256sums=('15eaabe9a264051ea5a52361f0f998bd66bfb0333891d72fe8e21e8f2d2967f1')
sha256sums_x86_64=('7397cc7d7c9a068426d7e9077da19010f59b4c7bf5e3bea4b0adc733c0b75e79')
sha256sums_aarch64=('9d8e07cc9f7a03d26bd87f6389e24c18b947f428cfcb5d8f0bd96a808b92f6f9')

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
