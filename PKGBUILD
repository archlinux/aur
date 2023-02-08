# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>

pkgname=python-debmutate
_pkg="${pkgname#python-}"
pkgver=0.65
pkgrel=1
pkgdesc="Format-preserving manipulation of Debian control files in Python"
arch=('any')
url="https://salsa.debian.org/jelmer/debmutate"
license=('GPL2')
depends=('python-debian' 'python-merge3' 'python-tr')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=('python-tomlkit')
checkdepends=('python-pytest' 'python-semver' 'python-tomlkit')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/debmutate-$pkgver.tar.gz")
sha256sums=('3750264fab3f532253fe37b371703a47ff0b0e8db5250ec180157117aec52098')

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest -x --ignore tests/test_watch.py
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir "$pkgdir" dist/*.whl
}
