# Maintainer: bKNNNNN <https://github.com/bKNNNNN>
pkgname=claude-cowork-rs
pkgver=0.1.0
pkgrel=1
pkgdesc="Linux daemon for Claude Desktop Cowork (Local Agent Mode)"
arch=('x86_64' 'aarch64')
url="https://github.com/bKNNNNN/claude-cowork-rs"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('8d0290055ce344335178b89768352f7db832931e410c8510e1dafb5d5b7bb55d')

build() {
    cd "$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "packaging/claude-cowork.service" "$pkgdir/usr/lib/systemd/user/claude-cowork.service"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
