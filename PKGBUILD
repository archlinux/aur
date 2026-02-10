# Maintainer: Arnaud Gissinger <me@mathix.dev>
pkgname=rofi-linear-git
pkgver=0.1.0
pkgrel=1
pkgdesc="Rofi plugin for creating Linear issues"
arch=('x86_64')
url="https://github.com/mathix420/rofi-linear"
license=('MIT')
depends=('rofi')
makedepends=('rust' 'cargo' 'git')
provides=('rofi-linear')
conflicts=('rofi-linear')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd rofi-linear
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/-/.r/;s/-/./' || echo "0.1.0.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd rofi-linear
    cargo build --release --locked
}

package() {
    cd rofi-linear
    install -Dm755 "target/release/rofi-linear" "$pkgdir/usr/bin/rofi-linear"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
