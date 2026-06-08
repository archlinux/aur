# Maintainer: Mbonikev <mb0ni@proton.me>
pkgname=melo
pkgver=0.1.3
pkgrel=1
pkgdesc="A stylish TUI music player for local libraries that follows your terminal/omarchy theme"
arch=('x86_64' 'aarch64')
url="https://github.com/mbonikev/melo"
license=('MIT')
depends=('alsa-lib' 'dbus')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('db8f5df6e920f23b93297938faa780ea2b3f5fd0e6f140a860ddad1cc6d5bf40')

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
