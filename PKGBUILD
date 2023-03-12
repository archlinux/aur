pkgname=unzipx-git
pkgver=0.1.0.27.g1a4f74d
pkgrel=1
pkgdesc="Rust unzip, support for parallel decompression, automatic detection encoding"
arch=("${CARCH}")
url="https://github.com/quininer/unzipx"
license=('MIT')
depends=('cargo' 'zstd')
makedepends=('cargo' 'git')
optdepends=()
provides=('unzipx')
conflicts=('unzipx')
source=(git+${url}.git)
sha256sums=('SKIP')

pkgver() {
	cd ${pkgname%-git}
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git describe --always)
}

build() {
	cd ${pkgname%-git}
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	install -D -m755 "$srcdir/${pkgname%-git}/target/release/unzrip" "$pkgdir/usr/bin/unzipx"
}
