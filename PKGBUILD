# Maintainer: Mikal Villa <spam@mux.rs>
pkgname=mcdu
pkgver=0.5.0
pkgrel=1
pkgdesc="Modern disk usage analyzer with TUI and developer cleanup tools"
arch=('x86_64' 'aarch64')
url="https://github.com/mikalv/mcdu"
license=('MIT')
depends=('gcc-libs')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/mikalv/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('90a281ba6ce7972330051ba92809b58c7a35e5ea70b1e2136f0af70ed5b50b0b')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
