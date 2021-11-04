# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-coveralls
pkgver=3.3.0
pkgrel=1
pkgdesc="Python integration with coveralls.io"
url="https://github.com/thekevjames/coveralls-python"
arch=('any')
license=('MIT')
depends=(
	'python-coverage>=4.1'
	'python-coverage<7.0'
	'python-docopt>=0.6.1'
	'python-requests>=1.0.0'
	'python')
optdepends=('python-yaml>=3.10')
makedepends=('python-setuptools')
checkdepends=('git' 'python-mock' 'python-pytest' 'python-responses')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('466ade75b818f8fb240a3049de0d3896a7d1efec878ead7b4d878935a7af386a')

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
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
}
