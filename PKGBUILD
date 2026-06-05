# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-unstable-bin
pkgver=0.8.17
pkgrel=1
pkgdesc="moshpit client with post-quantum support — SSH and Mosh inspired remote terminal client (pre-compiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit')
conflicts=('moshpit' 'moshpit-bin')
replaces=('moshpit-bin')
depends=('moshpit-keygen')
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp.tar.gz")
source_x86_64=("mp-unstable-x86_64::${_base}/mp-unstable-x86_64-unknown-linux-musl")
source_aarch64=("mp-unstable-aarch64::${_base}/mp-unstable-aarch64-unknown-linux-musl")
sha256sums=('4cedd9ebffaa65997d0bc8cfda569a8c4b44d87818b7fe49f19ea42a8a503a56')
sha256sums_x86_64=('c05b1876aa4d86d4d3a2276b8b9efcde11beac10133f7c88a87296fafa086f0f')
sha256sums_aarch64=('131e0418272dc11726bbf93d4691423c922be2fd2c560c8a1db7475ee9c876a6')

package() {
    install -Dm755 "mp-unstable-${CARCH}" "$pkgdir/usr/bin/mp"

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
