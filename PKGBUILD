# Maintainer: Jason Ozias <jason.g.ozias@gmail.com>

pkgname=moshpit-bin
pkgver=0.8.20
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
sha256sums=('9afa6ab813d85c5e7bd1303d516d5cb84ff92197a2ac7a832c6b84740f2c92a8')
sha256sums_x86_64=('3c061f6a0753abdf5c735a41b8f7f3d1ef6d13a00e4d3143950947c4bfaa6b68')
sha256sums_aarch64=('1d9b3c0bf74a4550b3b0fd46443e2a828bc24622f0a7da2a109778246cee4fb8')

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
