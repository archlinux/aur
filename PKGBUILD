# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-keygen-bin
pkgver=0.8.18
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
sha256sums=('3201fdb5e9c09a235fac0a30e89e5f3b484ec229b63a1968bacca3407fb871fc')
sha256sums_x86_64=('5d026425ce050a9b88fb209ecbc19445605b6c2795e37edcc70baabb7030f621')
sha256sums_aarch64=('baf32f714b3c2a64633c3f8865cf1b1b90e5dbb826ccbe82c809362961410a46')

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
