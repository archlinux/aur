pkgname=xargo-git
_pkgname=xargo
pkgdesc="The sysroot manager that lets you build and customize std"
pkgrel=1
pkgver=0.3.8.222
arch=('i686' 'x86_64')
conflicts=("xargo")
provides=("xargo")
url="https://github.com/japaric/xargo"
license=('Apache' 'MIT')
depends=('rust' 'cargo')
makedepends=('rust' 'cargo')
optdepends=('rust-src: rust std source code')
source=("$_pkgname::git+https://github.com/japaric/xargo")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	env CARGO_INCREMENTAL=0 cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "$srcdir/$_pkgname/target/release/xargo" "$pkgdir/usr/bin/xargo"
}
