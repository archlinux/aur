# Maintainer: Limehawk <128890849+limehawk@users.noreply.github.com>
pkgname=lazyreno
pkgver=0.4.0
pkgrel=1
pkgdesc="TUI dashboard for self-hosted Renovate CE"
arch=('x86_64' 'aarch64')
url="https://github.com/limehawk/lazyreno"
license=('MIT')
depends=('openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/limehawk/lazyreno/archive/v$pkgver.tar.gz")
sha256sums=('755e87b8f80c54564ab45e2e871f088185704388e71f9f9dea67ff66417d4098')

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
