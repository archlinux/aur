# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: bitwave

pkgname=python-pycaption
_name=${pkgname#python-}
pkgver=2.0.1
pkgrel=1
pkgdesc="Python module to read/write popular video caption formats"
arch=('any')
url="https://github.com/pbs/pycaption"
license=('Apache')
depends=(
	'python-beautifulsoup4>=4.8.1'
	'python-beautifulsoup4<4.10'
	'python-lxml>=4.6.3'
	'python-lxml<4.7'
	'python-cssutils>=2.0.0'
	'python-cssutils<2.4')
makedepends=('python-setuptools')
checkdepends=('python-pytest>=6.2.0' 'python-pytest-lazy-fixture=0.6.3')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/p/pycaption/pycaption-$pkgver.tar.gz")
sha256sums=('d225c8445a3fd766ea541429dea796de5e155ddcab1069f369e9e2502a5c070d')

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
	pytest
}

package() {
	cd "pycaption-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
