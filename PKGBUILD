# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
pkgname=python-debmutate
_name=${pkgname#python-}
pkgver=0.34
pkgrel=1
pkgdesc="Format-preserving manipulation of Debian control files in Python"
arch=('any')
url="https://salsa.debian.org/jelmer/debmutate"
license=('GPL2')
depends=('python-debian' 'python-merge3' 'python-tr')
makedepends=('python-setuptools')
optdepends=('python-semver' 'python-tomlkit')
source=("https://salsa.debian.org/jelmer/debmutate/-/archive/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('af0fdf739753b7943399d86851a7343b26d957a95f09fa0cbf15234826e69e72')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

check() {
	cd "$_name-$pkgver"
	python setup.py test
}

package() {
	cd "$_name-$pkgver"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
