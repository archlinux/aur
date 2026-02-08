pkgname=lazyrss
pkgver=0.1.0
pkgrel=4
pkgdesc="A terminal-based RSS/Atom feed reader TUI inspired by lazygit"
arch=('x86_64' 'aarch64')
url="https://github.com/sujaltv/lazyrss"
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cargo' 'rust' 'pkgconf')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/sujaltv/lazyrss/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a6640344a7d3933bada25daadc754f8d6b8b799f5d69b03f864d795b113fafdf')

prepare() {
    cd "$pkgname-$pkgver"
    cargo fetch --locked
}

build() {
    cd "$pkgname-$pkgver"
    cargo build --frozen --release
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --frozen
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "man/$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
