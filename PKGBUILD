# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-testdata
pkgver=5.0.1
pkgrel=1
pkgdesc="Generates random test data"
arch=('any')
url="https://github.com/jaymon/testdata"
license=('MIT')
depends=('python-datatypes')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/t/testdata/testdata-$pkgver.tar.gz")
sha256sums=('555d0946debd5864fd69f5ceb3083347208df950699fd06c74338926cf045a75')

prepare() {
	cd "testdata-$pkgver"
	sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

build() {
	cd "testdata-$pkgver"
	python setup.py build
}

## tries to find nonexistant attribute
# check() {
# 	cd "testdata-$pkgver"
# 	python -m unittest discover
# }

package() {
	cd "testdata-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
