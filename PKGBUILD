# Maintainer: l-koehler <lorenz.koehler@posteo.de>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=gay
pkgver=1.3.4
pkgrel=1
pkgdesc="Pride-colored text output"
arch=('any')
url="https://github.com/ms-jpq/gay"
license=('MIT')
depends=('python>=3.7')
makedepends=('python-build' 'python-setuptools' 'python-wheel' 'python-installer')
source=(
	"$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/g/$pkgname/$pkgname-$pkgver.tar.gz"
	"$url/raw/<3/LICENSE")
sha256sums=('a52c51ad79efe2d7eeedac159ceb10c02d99392e2ab1f0a984547f7e94cd74f7'
            'f9698208ec005b3994984d4151ca62c04858e0c6a379ad6f9e9192604cd33b95')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
