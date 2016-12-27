pkgname=parity-git
_pkgname=parity
pkgdesc="Fast, light, robust Ethereum implementation"
pkgrel=1
pkgver=1.5.0.7759
arch=('i686' 'x86_64')
conflicts=("parity")
provides=("parity")
url="https://github.com/ethcore/parity"
license=('GPL-3.0')
depends=('rocksdb')
makedepends=('rust' 'cargo' 'git')
source=('git+https://github.com/ethcore/parity.git')
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
	install -D -m755 "$srcdir/$_pkgname/target/release/parity" "$pkgdir/usr/bin/parity"
	install -D -m644 "$srcdir/$_pkgname/scripts/parity.service" "$pkgdir/usr/lib/systemd/system/parity.service"
	install -D -m644 "$srcdir/$_pkgname/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
