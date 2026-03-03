# Maintainer: Jos Dehaes <jos@dehaes.be>
pkgname=mergers
pkgver=0.5.0
pkgrel=1
pkgdesc="A visual diff and merge tool written in Rust with GTK4"
arch=('x86_64' 'aarch64')
url="https://github.com/joske/mergers"
license=('GPL-2.0-only')
depends=('gtk4' 'gtksourceview5')
makedepends=('rustup')
source=("$pkgname-$pkgver.tar.gz::https://github.com/joske/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('f1fd5ebdaea8c09301c4aa85b4a4c7e86ea8e54247507df5cd6af28a5e7cf847')

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
