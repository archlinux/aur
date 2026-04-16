# Maintainer: Forrest Knight <forrest.knight.yt@gmail.com>
pkgname=waycal
pkgver=0.2.0
pkgrel=1
pkgdesc="A tiny Waybar calendar popup for wlr-layer-shell compositors"
arch=('x86_64')
url="https://github.com/forrestknight/waycal"
license=('MIT')
depends=('gtk4' 'gtk4-layer-shell')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/forrestknight/waycal/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0f6f58257fd5e5c2423a9ed29aa659ed14bd5549593eee96fbd3c61b8f1bd98f')

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
