# Maintainer: Ashley Ruglys <ashley.ruglys@gmail.com>
pkgname=polkadot-git
_pkgname=polkadot
pkgdesc="Polkadot Node Implementation"
pkgrel=1
pkgver=0.7.26.670
arch=('i686' 'x86_64')
provides=("polkadot")
url="https://github.com/paritytech/polkadot"
license=('GNU')
depends=()
makedepends=('rust' 'cargo')
source=("$_pkgname::git+https://github.com/paritytech/polkadot.git")
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
	install -D -m755 "$srcdir/$_pkgname/target/release/polkadot" "$pkgdir/usr/bin/polkadot"
}
