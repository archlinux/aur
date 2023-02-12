pkgname=unzipx-git
pkgver=0.1.0.19.gc6ceb86
pkgrel=1
pkgdesc="Rust unzip, support for parallel decompression, automatic detection encoding"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/quininer/unzipx"
license=('MIT')
depends=('cargo' 'zstd')
makedepends=('cargo' 'git')
optdepends=()
provides=('unzipx')
conflicts=('unzipx')
source=($pkgname::git+https://github.com/quininer/unzipx.git)
sha256sums=('SKIP')

pkgver() {
	cd $pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd $pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $pkgname
	install -D -m755 "$srcdir/$pkgname/target/release/unzipx" "$pkgdir/usr/bin/unzipx"
}
