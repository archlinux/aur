# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: TransistorLogic <liuhongwu2003@outlook.com>

pkgname=python-xeger
pkgver=0.3.5
pkgrel=2
pkgdesc="A library for generating random strings from a valid regular expression."
license=('BSD')
arch=('any')
url="https://github.com/crdoconnor/xeger"
depends=('python')
makedepends=('python-setuptools')
checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/x/xeger/xeger-$pkgver.tar.gz"
        "LICENSE::$url/raw/master/LICENSE.txt")
sha256sums=('2a91341fc2c814b27917b8bd24e8d212c8a3b904d98e9a6703d27484c2cb0f82'
            'eddc4d81d82f642e4a1bd9995666ca8fcf1aff8a59b2d4d20b173988d709d8a8')

build() {
	cd "xeger-$pkgver"
	python setup.py build
}

check() {
	cd "xeger-$pkgver"
	pytest
}

package() {
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	cd "xeger-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 README.rst -t "$pkgdir/usr/share/doc/$pkgname/"
}
