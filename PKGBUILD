pkgname=parity-git
_pkgname=parity
pkgdesc="Fast, light, robust Ethereum implementation"
pkgrel=1
pkgver=0.9.99.2102
arch=('i686' 'x86_64')
conflicts=("parity")
provides=("parity")
url="https://github.com/ethcore/parity"
license=('AGPL-3.0')
depends=('rocksdb')
makedepends=('rust>=1.7' 'rust<1.8' 'cargo' 'git' 'python-pytoml')
source=('git://github.com/ethcore/parity.git')
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(python -c "print(__import__('pytoml').loads(open('Cargo.toml').read())['package']['version'])").$(git rev-list --count HEAD)"
}

build() {
	cd $_pkgname
	cargo update
	cargo build --release
}

package() {
	cd $_pkgname
	install -D -m755 "${srcdir}/${_pkgname}/target/release/parity" "${pkgdir}/usr/bin/parity"
}
