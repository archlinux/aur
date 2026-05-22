# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-bin
pkgver=0.8.6
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
sha256sums=('32063f077ec9e5bb3232e3098ca0937b756d41eb46496fcd784d5a4602b01e39')
sha256sums_x86_64=('37403b23911ee41db269247bc43972c768afb184e822fc3f77340a17e287e2c2')
sha256sums_aarch64=('58fffbc7b05affe5ff59659b02c03cd76184da54d8c51981e0c2107c572d3d19')

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
