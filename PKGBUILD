# Maintainer: Yo'av Moshe <archlinux@yoavmoshe.com>
pkgname=wttrbar
pkgver=0.3
pkgrel=0
pkgdesc="Weather indicator for Waybar"
url="https://github.com/bjesus/wttrbar"
arch=("any")
license=("MIT")
makedepends=('rust')
source=("source.tar.gz::https://github.com/bjesus/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=("26b76b93f2feacb35598abb00e42215dad88c57410f0c984a57d1ebb0823bb1a3c57603fdb1d23a578b6b1171ad266db8af8902811c9ea8a3265e9ce3e852296")

prepare() {
    mv $pkgname-$pkgver/* .
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}

