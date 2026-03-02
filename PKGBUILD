# Maintainer: Jos Dehaes <jos@dehaes.be>
pkgname=mergers
pkgver=0.4.8
pkgrel=1
pkgdesc="A visual diff and merge tool written in Rust with GTK4"
arch=('x86_64' 'aarch64')
url="https://github.com/joske/mergers"
license=('GPL-2.0-only')
depends=('gtk4' 'gtksourceview5')
makedepends=('rustup')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joske/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0262c8aca7d50ed0ed11e3c6ef08143876162ef94fb315f011030327a5db6f87')

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
