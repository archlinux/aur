# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo
pkgver=0.1.2
pkgrel=1
pkgdesc="A stylish TUI music player for local libraries that follows your terminal/omarchy theme"
arch=('x86_64' 'aarch64')
url="https://github.com/mbonikev/melo"
license=('MIT')
depends=('alsa-lib' 'libnotify' 'dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da81f5a4a7f8418e458b3e4a008de4aa87a6f0288d9fcd936ffe62c51c980491')

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

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
