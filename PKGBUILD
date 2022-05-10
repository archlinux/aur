# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.9
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('a9d434a13fc387566d2a329c7ea1ce423034cf6deb8b28757123bc05656840c5')

prepare() {
	cd "pycaption-$pkgver"
	sed -i "/packages=/s/()/(exclude=['tests*'])/" setup.py
}

build() {
	cd "pycaption-$pkgver"
	python -m build --wheel --no-isolation
}

check() {
	cd "pycaption-$pkgver"
	pytest -x --disable-warnings
}

package() {
	cd "pycaption-$pkgver"
	PYTHONHASHSEED=0 python -m installer --destdir="$pkgdir/" dist/*.whl
}
