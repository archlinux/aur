# Maintainer: Kai Zarzycki <me@kaizarzycki.com>
pkgname=date12
pkgver=0.2.0
pkgrel=1
pkgdesc="Alternative calendar with 12-day weeks and 60-day months"
arch=('x86_64' 'aarch64' 'riscv64' 'armv7h')
url="https://gitlab.com/kaizarzycki/date12"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo')
options=('!debug')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('2514271604bef98551a581ea96a4a6a189351da825cae7fd1dfc5a3762f3eb96')

build() {
    cd "$pkgname-v$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$pkgname-v$pkgver"
    cargo test --frozen --all-features
}

package() {
    cd "$pkgname-v$pkgver"
    install -Dm755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
