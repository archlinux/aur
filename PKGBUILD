pkgname=twiggy-git
_pkgname=twiggy
pkgdesc="Twiggy is a code size profiler"
pkgrel=1
pkgver=0.1.0.118
arch=('i686' 'x86_64')
conflicts=("twiggy")
provides=("twiggy")
url="https://github.com/rustwasm/twiggy"
license=('NULL')
depends=()
makedepends=('rust' 'cargo')
optdepends=()
source=("$_pkgname::git+https://github.com/rustwasm/twiggy")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname/twiggy
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2|cut -d\- -f1).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/twiggy" "$pkgdir/usr/bin/twiggy"
}
