# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
pkgver=3.2.0
pkgrel=2
pkgdesc="Python integration with coveralls.io"
url="https://github.com/thekevjames/coveralls-python"
arch=('any')
license=('MIT')
depends=(
	'python-coverage>=4.1'
	'python-coverage<6.0'
	'python-docopt>=0.6.1'
	'python-requests>=1.0.0'
	'python>=3.5')
optdepends=('python-yaml>=3.10')
makedepends=('python-setuptools')
checkdepends=('git' 'python-mock' 'python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('fff8fd52fc2d374a5f8be267ca44df7993ca721a8d50ed62f6e8c05eded4112e')

build() {
	cd "coveralls-python-$pkgver"
	python setup.py build
}

check() {
	cd "coveralls-python-$pkgver"
	pytest
}

package() {
	cd "coveralls-python-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
