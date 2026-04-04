# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.2.9
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('f5aa5cf53b2972064f69cdd227db0c445edc889c0de2437674483b86ee0e1caf')

build() {
    cd "$pkgname-$pkgver"
    export RUSTFLAGS="-C strip=symbols"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
