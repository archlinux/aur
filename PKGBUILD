# Maintainer: tesnos6921 <tesnos at 6921 dot space>
pkgname=polybar-peekaboo
pkgver=0.1.1
pkgrel=1
pkgdesc="highlight your wallpaper by hiding polybar when no windows are open"
arch=('x86_64')
url="https://github.com/tesnos/polybar-peekaboo"
license=('MIT')
depends=('i3-wm' 'polybar')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/tesnos/$pkgname/archive/refs/tags/$pkgver.tar.gz")
sha512sums=('797c37159da0395b5ba6c8225d6027bc366857d3ac5ac8bf3d655f29fc48cf2e33f7ec9c77191a8326a35a0ef7df986a5c7144ed68e9358f4f9d95a51a47a9fb')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}