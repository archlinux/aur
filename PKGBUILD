# Maintainer: Aidan McConnon <https://github.com/PndaMan>
pkgname=rustbust
pkgver=0.1.0
pkgrel=1
pkgdesc="A fast, async web reconnaissance tool. sehr quick."
arch=('x86_64' 'aarch64')
url="https://github.com/PndaMan/rustbust"
license=('MIT')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/PndaMan/rustbust/archive/v$pkgver.tar.gz")
sha256sums=('9a0e02607628390445be4d957e2c92ba1ddd7ac0c96154a7f44b15886ccd4609')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
