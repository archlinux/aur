# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Robert Kubosz <kubosz.robert@gmail.com>

pkgname=python-abjad-ext-nauert
pkgver=3.4
pkgrel=2
pkgdesc="Abjad quantization extension, based on Paul Nauert's Q-Grids"
arch=('any')
url="https://github.com/abjad/abjad-ext-nauert"
license=('MIT')
groups=('abjad')
depends=("python-abjad>=$pkgver")
makedepends=('python-setuptools' 'python-build' 'python-install' 'python-wheel')
# checkdepends=('python-pytest')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('0050b437498d4b2292dd36ae4d073a5aae786fa803c74f107201839a52fe86d0')

build() {
	cd "abjad-ext-nauert-$pkgver"
	python -m build --wheel --skip-dependency-check --no-isolation
}

## tests segfault
# check() {
# 	cd "abjad-ext-nauert-$pkgver"
# 	pytest -x -c /dev/null
# }

package() {
	export PYTHONHASHSEED=0
	cd "abjad-ext-nauert-$pkgver"
	python -m install --optimize=1 --destdir="$pkgdir/" dist/*.whl
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
