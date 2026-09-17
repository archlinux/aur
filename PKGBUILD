# Maintainer: Forrest Knight <forrest.knight.yt@gmail.com>
pkgname=waycal
pkgver=0.2.1
pkgrel=1
pkgdesc="A tiny Waybar calendar popup for wlr-layer-shell compositors"
arch=('x86_64' 'aarch64')
url="https://github.com/forrestknight/waycal"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/forrestknight/waycal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9840632e2600a9bd48aafea5be6a7736dc3e76771a0731f0d289a1548984a1ac')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
