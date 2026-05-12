# Maintainer: franlol
pkgname=hyprscreen
pkgver=0.1.3
pkgrel=1
pkgdesc="A first-class screenshot and screen-recording app built for Hyprland"
arch=('x86_64')
url="https://github.com/franlol/hyprscreen"
license=('MIT')
depends=('gtk4' 'grim' 'slurp' 'wf-recorder' 'wl-clipboard' 'hyprland' 'ffmpeg')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6120f69946878f6bf26e6279dc9ac921e98a7a48c4210eef32aa91002a9bece1')

prepare() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --release --locked --offline
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
