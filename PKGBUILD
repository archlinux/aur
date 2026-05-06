# Maintainer: Junjie <junjie@omni-stream.ai>
pkgname=omni-code-bridge
pkgver=0.1.0
pkgrel=1
pkgdesc="Rust bridge for Omni Code — connects mobile clients to local coding agents"
arch=('x86_64' 'aarch64')
url="https://github.com/omni-stream-ai/omni-code-bridge"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
backup=('etc/omni-code-bridge/.env')
source=("$pkgname-$pkgver.tar.gz::https://github.com/omni-stream-ai/omni-code-bridge/archive/refs/tags/v${pkgver}.tar.gz"
        "omni-code-bridge.service")
sha256sums=('SKIP'
            'SKIP')

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
    install -Dm644 "$srcdir/omni-code-bridge.service" "$pkgdir/usr/lib/systemd/system/omni-code-bridge.service"
    install -Dm644 /dev/null "$pkgdir/etc/omni-code-bridge/.env"
}
