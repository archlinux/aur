# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-nauert
pkgver=3.6
pkgrel=1
pkgdesc="Abjad quantization extension, based on Paul Nauert's Q-Grids"
arch=('any')
url="https://github.com/abjad/abjad-ext-nauert"
license=('MIT')
groups=('abjad')
depends=("python-abjad>=$pkgver")
makedepends=('python-setuptools' 'python-build' 'python-installer' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('87d0aa7aa075805f68bbf71552b8494d7affe1d512f6fb27b891a47d61893e96')

build() {
	cd "abjad-ext-nauert-$pkgver"
	python -m build --wheel --no-isolation
}

## tests segfault
# check() {
# 	cd "abjad-ext-nauert-$pkgver"
# 	pytest -x -c /dev/null
# }

package() {
	export PYTHONHASHSEED=0
	cd "abjad-ext-nauert-$pkgver"
	python -m installer --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
