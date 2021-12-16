# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
pkgver=2.0.3
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=('python-beautifulsoup4' 'python-lxml' 'python-cssutils')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-pytest-lazy-fixture=0.6.3')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('e6f37a9b6fbd5a7db57dce025fec1b2db6f5d645018abda33b6a161e356de436')

prepare() {
	cd "pycaption-$pkgver"
	sed -i "/packages=/s/()/(exclude=('tests*',))/" setup.py
	sed -i '/recursive-include/d' MANIFEST.in
}

build() {
	cd "pycaption-$pkgver"
	python setup.py build
}

check() {
	cd "pycaption-$pkgver"
	pytest -x
}

package() {
	cd "pycaption-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
