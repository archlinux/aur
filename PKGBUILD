pkgname=frust-git
_pkgname=frust
pkgdesc="A find replacement with SQL-like syntax"
pkgver=0.1.0.38
pkgrel=1
arch=('i686' 'x86_64')
conflicts=("frust")
provides=("frust")
url="https://github.com/tbehner/frust"
license=('MIT')
makedepends=('cargo')
depends=()
source=('git://github.com/tbehner/frust.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo $(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)
}

build() {
	cd $_pkgname
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/frust" "$pkgdir/usr/bin/frust"
}
