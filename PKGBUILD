# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pgmpy
pkgver=0.1.16
pkgrel=1
pkgdesc="Probabilistic Graphical Model library"
arch=('any')
url="https://github.com/pgmpy/pgmpy"
license=('MIT')
depends=(
	'python>=3.7'
	'python-joblib'
	'python-networkx'
	'python-numpy'
	'python-pandas'
	'python-pyparsing'
	'python-scipy'
	'python-scikit-learn'
	'python-statsmodels'
	'python-pytorch'
	'python-tqdm')
makedepends=(
	'python-setuptools'
	'python-sphinx'
	'python-nbsphinx'
	'python-sphinx_rtd_theme')
# checkdepends=('python-pytest' 'python-mock' 'python-daft')
changelog=CHANGELOG.md
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('4bd3b82a65a406e24f82ecffa5eda6ab8133220272a7e5471a134fcb0ec33ee5')

build() {
	cd "pgmpy-$pkgver"
	python setup.py build
	cd docs
	make man BUILDDIR=_build
}

# check() {
# 	cd "pgmpy-$pkgver"
# 	pytest
# }

package() {
	cd "pgmpy-$pkgver"
	PYTHONHASHSEED=0 python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm 644 docs/_build/man/pgmpy.1 -t "$pkgdir/usr/share/man/man1/"
}
