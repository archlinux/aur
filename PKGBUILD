# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-unstable-bin
pkgver=0.8.21
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
sha256sums=('501e39f51fb4c68da4ab00f51cd9a79ce19ae42a8785b8cbe88a561cf58fe620')
sha256sums_x86_64=('0da0b5452ad4dec85e2b377f5ff684ff6fb1bc4c9db9765b8c09577d10599e3d')
sha256sums_aarch64=('f6a8c715ddf26a635ae6b666f7323f6f61017cad39010472d6ceef8e2609805a')

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
