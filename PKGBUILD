# Maintainer: Qu Wenruo <wqu@suse.com>
pkgname=rapidquilt
pkgver=0.6.6
pkgrel=1
pkgdesc="This is very specialized reimplementation of quilt & patch in one. It supports only the push command. The goal is to be very fast."
url="https://github.com/openSUSE/rapidquilt"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/openSUSE/rapidquilt/archive/refs/tags/${pkgver}.tar.gz")
arch=('x86_64' 'aarch64')
license=('MIT')
makedepends=("rust" "cargo" "git")
provides=("rapidquilt")
sha256sums=("35e2dce9c6d7c2f6360e47e347437644523ba7afb28a769180b73eba76f677a2")

prepare()
{
	cd "$srcdir/$pkgname-$pkgver"
	cargo fetch --target "$CARCH-unknown-linux-gnu"
}

build()
{
	cd "$srcdir/$pkgname-$pkgver"
	CARGO_TARGET_DIR=target cargo build --frozen --release
}

check()
{
	cd "$srcdir/$pkgname-$pkgver"
	cargo test --frozen
}

package()
{
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm0755 target/release/rapidquilt "${pkgdir}/usr/bin/rapidquilt"
}
