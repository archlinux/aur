# Maintainer: Polarian <polarian@polarian.dev>

pkgname="eureka-notes"
pkgver="2.0.0"
pkgrel=3
pkgdesc="CLI tool which allows you to quickly write down ideas using your preferred editor"
arch=("x86_64")
url="https://github.com/simeg/eureka"
license=("MIT")
depends=("git")
makedepends=("cargo")
optdepends=("vi: Default text editor used by Eureka")
source=("eureka-$pkgver.tar.gz::https://github.com/simeg/eureka/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e874549e1447ee849543828f49c4c1657f7e6cfe787deea13d44241666d4aaa0')

prepare() {
    cd "eureka-$pkgver" && cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cd "eureka-$pkgver" && cargo build --frozen --release --all-features
}

package() {
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "eureka-$pkgver/LICENSE"
    install -Dm755 "eureka-$pkgver/target/release/eureka" "$pkgdir/usr/bin/eureka"
}
