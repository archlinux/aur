# Maintainer: bannert <aur@bannert.dev>

pkgname=python-sudoku-engine
pkgver=2.0.0
pkgrel=2
pkgdesc="A simple Python package that generates and solves m x n Sudoku puzzles."
arch=('any')
url="https://github.com/sepehr-rs/sudoku-engine"
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
options=('!debug')
source=("${pkgname#python-}-${pkgver}.tar.gz::https://github.com/sepehr-rs/sudoku-engine/archive/7470edf53ddd066f359fba635f1b1225096c48e9.tar.gz")
sha256sums=('d80ddf8aa7e5ea8a365557cb1714dfc4bcdc187341f8406eaf630b85477fd324')

_srcdir="sudoku-engine-7470edf53ddd066f359fba635f1b1225096c48e9"

build() {
	cd "$_srcdir"
	python -m build --wheel --no-isolation
}

package() {
	cd "$_srcdir"
	python -m installer --destdir="$pkgdir" dist/*.whl
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}