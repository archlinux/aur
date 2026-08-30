# Maintainer: Vasiliy Stelmachenok <ventureo@cachyos.org>
pkgname=flatpak-helper
pkgver=1.0.1
pkgrel=1
pkgdesc="CLI wrapper for Flatpak written in Rust"
arch=('x86_64')
url="https://github.com/ArisoN-ext/flatpak-helper"
license=('GPL-3.0-or-later')
makedepends=('git' 'rust' 'cargo')
depends=('flatpak' 'glibc' 'libgcc')
source=("git+${url}#tag=v${pkgver}")
sha256sums=('c6504b64083e1150d46b27b250bfde2fa43525b25dfd11400aea08935a6ab1a6')

prepare() {
    cd "$pkgname"
    cargo fetch --locked --target host-tuple
}

build() {
    cd "$pkgname"
    cargo build --frozen --release
}

package() {
    cd "$pkgname"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
