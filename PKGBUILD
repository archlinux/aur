# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jean Lucas <jean@4ray.co>

pkgname=python-isoweek
pkgver=1.3.3
pkgrel=3
pkgdesc='Objects representing a week'
arch=('any')
url='https://github.com/gisle/isoweek'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
changelog=CHANGES.txt
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/i/isoweek/isoweek-$pkgver.tar.gz")
sha256sums=('73f3f7bac443e05a3ab45c32a72048b0c4f26d53d81462ec4b142c7581d3ffe8')

build() {
	cd "isoweek-$pkgver"
	python setup.py build
}

check() {
	cd "isoweek-$pkgver"
	python -m unittest test_isoweek.py
}

package() {
	cd "isoweek-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root=$pkgdir --optimize=1 --skip-build
	install -Dm 644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
