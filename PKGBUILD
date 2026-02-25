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
sha256sums=('d6c9ccdee5840ab23191a733f7575449760cfcc668d94961e641c1c042796e92')

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
