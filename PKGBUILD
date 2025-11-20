# Maintainer: Endre Egseth
pkgname=waybar-weather-info
pkgver=0.1.2
pkgrel=1
pkgdesc="Waybar weather module using yr.no"
arch=('x86_64')
url="https://github.com/eegseth/waybar-weather-info"
license=('MIT')
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('64af907a79558c6b837754f3b8e0accbf7cb4dde5b8ea1d4aa66a6ddb967dd1d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

check() {
    cd "$pkgname-$pkgver"
    cargo test --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
