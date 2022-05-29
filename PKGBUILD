# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs
pkgver=0.3.0
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=(MIT)
conflicts=('mprocs-bin')
provides=('mprocs')
source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3c0b753d835ab143aa6cb325518f7ef50390a952b4adab82c68ed3e50c5a3c55')
makedepends=(rust)

build() {
	cd mprocs-$pkgver
	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	install -Dm755 "$srcdir/mprocs-$pkgver/target/release/mprocs" \
		"$pkgdir/usr/bin/mprocs"
}
