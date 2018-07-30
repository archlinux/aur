pkgname=ene-git
_pkgname=ene
pkgdesc="An experimental end to end email encryption tool"
pkgrel=1
pkgver=0.1.0.56
arch=('i686' 'x86_64')
conflicts=("ene")
provides=("ene")
url="https://github.com/quininer/ene"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/quininer/ene")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --features post-quantum --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/ene" "$pkgdir/usr/bin/ene"
}
