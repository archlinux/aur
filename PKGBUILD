# Maintainer: Nareg der Levonean <naregderlevonean@gmail.com>
pkgname=hyprmousetrap-git
pkgver=0.5.0
pkgrel=1
pkgdesc="A high-performance hot-corner and edge-action daemon for Hyprland"
arch=('x86_64' 'aarch64')
url="https://github.com/naregderlevonean/hyprmousetrap"
license=('GPL3')
depends=('gcc-libs' 'glibc')
makedepends=('rust' 'cargo' 'git')
provides=('hyprmousetrap')
conflicts=('hyprmousetrap')
source=("git+$url.git"
        "hyprmousetrap.conf")
sha256sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir/${pkgname%-git}"
    cargo build --release --locked
}

package() {
    cd "$srcdir/${pkgname%-git}"
    install -Dm755 "target/release/hyprmousetrap" "$pkgdir/usr/bin/hyprmousetrap"
    install -Dm644 "hyprmousetrap.conf" "$pkgdir/usr/share/hyprmousetrap/hyprmousetrap.conf"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
