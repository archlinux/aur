# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.2.3
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('17508f97e0e9c44d458245814559dd8e8221faebf7f4885e9dc61b6bc1467b22')

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
