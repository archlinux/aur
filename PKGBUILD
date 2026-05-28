# Maintainer: type1arc <type1arc@github>

pkgname=fetcher-cli
pkgver=0.1.0
pkgrel=1
pkgdesc="A configurable package fetcher written in Rust"
arch=('x86_64' 'aarch64')
url="https://github.com/type1arc/fetcher"
license=('Apache-2.0')
depends=('git')
makedepends=('cargo')
_commit=f0bde1ba6131c6a55c8817f44c0508110044bc4d
source=("$pkgname-$pkgver.tar.gz::https://github.com/type1arc/fetcher/archive/$_commit.tar.gz")
sha256sums=('d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed')

build() {
    cd "$srcdir/fetcher-$_commit"
    cargo build --release --locked
}

check() {
    cd "$srcdir/fetcher-$_commit"
    cargo test --release --locked
}

package() {
    cd "$srcdir/fetcher-$_commit"
    install -Dm755 target/release/fetcher "$pkgdir/usr/bin/fetcher"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
