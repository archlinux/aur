# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gay
pkgver=1.2.8
pkgrel=1
pkgdesc="Pride-colored text output"
arch=('any')
url="https://github.com/ms-jpq/gay"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-setuptools')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/gay/gay-$pkgver.tar.gz"
	"$url/raw/<3/LICENSE")
sha256sums=('ff8207a80a09b612af3722aa5209c63909206c2d1a04467ec7a7662965075e1d'
            'f9698208ec005b3994984d4151ca62c04858e0c6a379ad6f9e9192604cd33b95')

build() {
	cd "$pkgname-$pkgver"
	python setup.py build
}

package() {
	cd "$pkgname-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
