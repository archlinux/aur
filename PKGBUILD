# Maintainer: a821 (nospam) mail de
# Contributor: Vekhir <vekhir at yahoo dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
_pkg="${pkgname#python-}"
pkgver=2.3.5
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache-2.0')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=('b96f61dd4b875161b95b09bbefaf16c00344a9a42ffc348f0e74145677d9fe265b49ba5504cb8e4763905997602b0ac3a800123883c7cee3a5edf1e0e28174b4')

prepare() {
	cd "$_pkg-$pkgver"
	sed -i "/packages=/s/()/(exclude=['tests*'])/" setup.py
}

build() {
	cd "$_pkg-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "$_pkg-$pkgver"
	pytest --disable-warnings
}

package() {
	cd "$_pkg-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
}
