# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=python-pgmpy
pkgver=0.1.17
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
sha256sums=('1b2bc18dfcdb0d1f7d966061978b3ac5771849da5861f2a80dbea5ed799e5b3b')

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
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 docs/_build/man/pgmpy.1 -t "$pkgdir/usr/share/man/man1/"
}
