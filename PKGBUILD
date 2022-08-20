# Maintainer: Parham Alvani <parham.alvani@gmail.com>

pkgname=mprocs
pkgver=0.6.3
pkgrel=1
pkgdesc="Run multiple commands in parallel"
arch=(x86_64)
url="https://github.com/pvolok/mprocs"
license=(MIT)
conflicts=('mprocs-bin')
provides=('mprocs')
source=("https://github.com/pvolok/mprocs/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('da00ed6c693b9282b2553f69cee05eed039b1b3e948620c20b5d8ca6b2542aba')
makedepends=(rust)

build() {
	cd mprocs-$pkgver
	RUSTFLAGS="--remap-path-prefix=$(pwd)=/build/" cargo build --release --locked
}

package() {
	install -Dm755 "$srcdir/mprocs-$pkgver/target/release/mprocs" \
		"$pkgdir/usr/bin/mprocs"
	install -Dm644 "$srcdir/mprocs-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
