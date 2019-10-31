pkgname=grcov-git
_pkgname=grcov
pkgdesc="Rust tool to collect and aggregate code coverage data for multiple source files"
pkgrel=1
pkgver=0.5.5.519
arch=('i686' 'x86_64')
conflicts=("grcov")
provides=("grcov")
url="https://github.com/mozilla/grcov"
license=('Apache' 'MIT')
depends=('gcc')
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/mozilla/grcov")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/grcov" "$pkgdir/usr/bin/grcov"
}
