pkgname=alloy-git
pkgver=1.0.0.606.g7a954e8
pkgrel=1
pkgdesc="A fast and minimalistic image viewer forked from the now discontinued emulsion."
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/ardaku/alloy"
license=('MIT')
depends=('gcc-libs' 'libxi')
makedepends=('cargo')
optdepends=()
provides=('alloy')
conflicts=('alloy')
source=($pkgname::git+https://github.com/ardaku/alloy.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname/alloy
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	rm rust-toolchain.toml
	env CARGO_INCREMENTAL=0 cargo build --release --features avif
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/alloy" "$pkgdir/usr/bin/alloy"
}
