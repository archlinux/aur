# Maintainer: TreasureJim <boreback.work@gmail.com>

pkgname='dayrecap-git'
_pkgname=dayrecap
pkgver=0.2.0
pkgrel=1
pkgdesc="A notification client which prompts you to recap the the days events and log them."
arch=('x86_64')
url="https://github.com/TreasureJim/dayrecap"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('25ce10cd0dbc8ae68f7096c2f095f27bea004e3f660da088004a8d82677a0ea7')

prepare() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target $(rustc --print host-tuple)
}

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$_pkgname"
}
