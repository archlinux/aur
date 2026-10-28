# Maintainer: Ateles
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=termtastic
pkgver=1.0.0_alpha5
pkgrel=1
pkgdesc='Feature-rich handmade Meshtastic console client'
arch=('x86_64' 'aarch64')
url='https://github.com/acelot/termtastic'
license=('GPL-3.0-only')
depends=('gcc-libs')
optdepends=()
makedepends=('cargo' 'git')
provides=('termtastic')
conflicts=('termtastic')
source=("$pkgname::git+$url#tag=v${pkgver/_/-}")
sha256sums=('SKIP')
options=(!lto)

build() {
    cd "$srcdir/$pkgname" || exit 1
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname" || exit 1
    install -Dm755 'target/release/termtastic' "$pkgdir/usr/bin/termtastic"
    install -Dm644 'LICENSE'                   "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 'README.md'                 "$pkgdir/usr/share/doc/$pkgname/README.md"
}
