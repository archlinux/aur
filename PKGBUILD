# Maintainer: Jos Dehaes <jos@dehaes.be>
pkgname=mergers
pkgver=0.5.3
pkgrel=1
pkgdesc="A visual diff and merge tool written in Rust with GTK4"
arch=('x86_64' 'aarch64')
url="https://github.com/joske/mergers"
license=('GPL-2.0-only')
depends=('gtk4' 'gtksourceview5')
makedepends=('rustup')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joske/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('bd0c87bed85dfe75a78fa915647ca3f8282f608d57578d4db2f1d9f7bfbda152')

build() {
    cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=1.93
    cargo build --locked --release
}

package() {
    cd "$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "assets/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
    install -Dm644 "assets/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/$pkgname.svg"
}
