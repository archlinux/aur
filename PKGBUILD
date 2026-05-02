# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-bin
pkgver=0.3.1
pkgrel=1
pkgdesc="moshpit client — SSH and Mosh inspired remote terminal client (pre-compiled binary)"
arch=('x86_64')
url="https://github.com/rustyhorde/moshpit"
license=('MIT' 'Apache-2.0')
provides=('moshpit')
conflicts=('moshpit')
depends=('moshpit-keygen')
makedepends=()

_base="https://github.com/rustyhorde/moshpit/releases/download/v${pkgver}"

source=("${_base}/dist-mp.tar.gz")
source_x86_64=("mp-x86_64::${_base}/mp-x86_64-unknown-linux-musl")
sha256sums=('c311dd1cd4d48eaf86ac4886ae3afdab8fa4024b6663b8694b1ff6b0c03fc8cf')
sha256sums_x86_64=('9f90e26260aef2589eff765c593cf4085160a43448137d8b39029f9b047c4577')

package() {
    install -Dm755 mp-x86_64 "$pkgdir/usr/bin/mp"

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
