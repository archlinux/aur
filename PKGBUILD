# Maintainer: Tim Lagnese tim@inept.tech

pkgname=pulseshitter
pkgver=2.1.1
pkgrel=1
pkgdesc="Adds audio to your Discord video stream"
arch=('i686' 'x86_64')
url="https://github.com/Enitoni/$pkgname"
license=('MPL2')
depends=(libpulse)
makedepends=(cargo)
optdepends=("pulseaudio: For pulseaudio backend", "pipewire: For pipewire backend")
source=("$pkgname-$pkgver.tar.gz::https://github.com/Enitoni/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bf63bb61ca575d0f7e59c9ed36c8a0200a41cc7bd1c36e9d8681a683c35d0949c3e0738e5c80f6385bd98d71529a90939352d8d19276abc82052e3f888c51c7e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

check() {
    cd "$srcdir/$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo test --frozen --all-features
}

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/" "$srcdir/$pkgname-$pkgver/target/release/$pkgname"
}
