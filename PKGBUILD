# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-bin
pkgver=0.8.13
pkgrel=1
pkgdesc="moshpit client — SSH and Mosh inspired remote terminal client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit')
conflicts=('moshpit')
depends=('moshpit-keygen')
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp.tar.gz")
source_x86_64=("mp-x86_64::${_base}/mp-x86_64-unknown-linux-musl")
source_aarch64=("mp-aarch64::${_base}/mp-aarch64-unknown-linux-musl")
sha256sums=('653f54d78b03711f6772a6715c68dbdd5f88ed37cfa69ff91bfbe4832212ad57')
sha256sums_x86_64=('30f112350b83d510dad4c0d456a059ef56390c296e8beba164a1d4a4519d9e27')
sha256sums_aarch64=('ddc5a29e69a80c682260d2ef02da5785dadbdd612aa1819170a2e41253c0ce4a')

package() {
    install -Dm755 "mp-${CARCH}" "$pkgdir/usr/bin/mp"

    # Man page
    install -Dm644 mp/mp.1 "$pkgdir/usr/share/man/man1/mp.1"

    # Shell completions
    install -Dm644 mp/mp.bash \
        "$pkgdir/usr/share/bash-completion/completions/mp"
    install -Dm644 mp/_mp \
        "$pkgdir/usr/share/zsh/site-functions/_mp"
    install -Dm644 mp/mp.fish \
        "$pkgdir/usr/share/fish/vendor_completions.d/mp.fish"

    # Example config
    install -Dm644 mp/moshpit.toml.example \
        "$pkgdir/usr/share/doc/$pkgname/examples/moshpit.toml.example"

    # Licenses
    install -Dm644 mp/LICENSE-MIT    "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 mp/LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
