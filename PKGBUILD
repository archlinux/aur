pkgname=sek-git
pkgver=0.1.0.212.ga4002f4
pkgrel=1
pkgdesc="Rust unzip, support for parallel decompression, automatic detection encoding"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/quininer/sek"
license=('MIT')
depends=('zstd')
makedepends=('cargo' 'git')
optdepends=()
provides=('sek')
conflicts=('sek')
source=($pkgname::git+https://github.com/quininer/sek.git)
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
	install -D -m755 "$srcdir/$pkgname/target/release/seksh" "$pkgdir/usr/bin/seksh"
}
