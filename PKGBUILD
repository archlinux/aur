# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.8
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('deed87d38e7f03c0a4ecedad7914b937bf698ed00f46ad15ee94ec9560e98797')

prepare() {
	cd "pycaption-$pkgver"
	sed -i "/packages=/s/()/(exclude=('tests*',))/" setup.py
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
