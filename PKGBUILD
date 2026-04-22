# Maintainer: Matthew Cushing <hgxtymphwn@privaterelay.appleid.com>
pkgname=wdotool
pkgver=0.1.3
pkgrel=1
pkgdesc="xdotool-compatible input automation for Wayland (libei + wlroots)"
arch=('x86_64' 'aarch64')
url="https://github.com/cushycush/wdotool"
license=('MIT' 'Apache-2.0')
depends=('libxkbcommon' 'wayland')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('71a6256be8bc0319bdbc16f16617b57084b1c4da52c801c6282d9d057bd704d0')

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
