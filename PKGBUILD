# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-bin
pkgver=0.8.9
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
sha256sums=('4b047dcf4ee48479c2a6f8dca2808b71f849037362d76aa9d37984225ab2309c')
sha256sums_x86_64=('2e728d67fa19616f09400cf9ea7e5676afc85ad6420dd8f710043fba2e667dfb')
sha256sums_aarch64=('c42ef687f16b86a1ce75b2c190bd42af35486f08f5c38c5e5fbd7ee139659b86')

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
