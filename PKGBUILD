# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool
pkgver=0.1.4
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (libei + wlroots)"
arch=('x86_64' 'aarch64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9e2301dd5f45f8245b48d9066aa775890d7d5e26c95e43ae3a435a7e09d1cc99')

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

check() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
    install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
}
