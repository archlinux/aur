# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-unstable-bin
pkgver=0.8.4
pkgrel=1
pkgdesc="moshpit client with post-quantum support — SSH and Mosh inspired remote terminal client (pre-compiled binary)"
arch=('x86_64')
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
sha256sums=('68e4ffbe6ee8bb5cbef34bfec816af1a9a64f661b4230313f9c61ad9ac5f36ea')
sha256sums_x86_64=('191ad764705497068c1713f1b33b0d84297690f6864c108eb28cc05337904334')

package() {
    install -Dm755 mp-unstable-x86_64 "$pkgdir/usr/bin/mp"

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
