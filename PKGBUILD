# Maintainer: Wren Arco <wren.arco@gmail.com>
pkgname=vesper-ctui
pkgver=0.1.0
pkgrel=1
pkgdesc="Terminal tables, charts, trees, diagrams, banners, spinners"
arch=('x86_64')
url="https://github.com/Rinzlo/ctui"
license=('MIT')
depends=()
makedepends=('cargo' 'rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d993b49f2cc575ba8a1f4888f2d47151c0e2a7ddb2ca54d0fbb7d3bab0a11899')

prepare() {
    cd "ctui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "ctui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

check() {
    cd "ctui-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo test --frozen --release
}

package() {
    cd "ctui-$pkgver"
    install -Dm755 target/release/ctui "$pkgdir/usr/bin/ctui"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
