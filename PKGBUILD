# Maintainer: Jos Dehaes <jos@dehaes.be>
pkgname=mergers
pkgver=0.3.11
pkgrel=1
pkgdesc="A visual diff and merge tool written in Rust with GTK4"
arch=('x86_64' 'aarch64')
url="https://github.com/joske/mergers"
license=('GPL-2.0-only')
depends=('gtk4' 'gtksourceview5')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joske/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

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
    install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "assets/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
