# Maintainer: Nicholas <allyncat1 at gmail dot com>
pkgname='keepc'
pkgver=0.1.3
pkgrel=1
pkgdesc="CLI note taking app for commands! Coded in Rust."
arch=('x86_64')
url="https://github.com/nickcat1/keepc"
license=('GPL-3.0')
depends=('glib2' 'glibc' 'gcc-libs')
makedepends=('cargo')
optdepends=('nano: text editing support')
provides=('keepc')
conflicts=('keepc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('492b1facb5c5f8b2177802d6dacf9776876281738bd946d31cfc6c9297ec4412')

prepare() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release --all-features
}

package() {
	install -Dm755 "$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
