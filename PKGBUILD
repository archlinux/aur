# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-bin
pkgver=0.9.1
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
sha256sums=('f4c717c12527b87bed84de76e85dae067e0554ac0746ed538e34cbfb7452556a')
sha256sums_x86_64=('7b2485504174f3d7df1a03a30a7ff042476c45d66685a7dafa8eba22fa398076')
sha256sums_aarch64=('9c2d69d40ab7cb94012f934a24f8bf10fc1f6f5d4ce4780d332d4ba1415b3581')

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
