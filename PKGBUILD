# Maintainer: Markus Richter <mqus at disroot dot org>
_pkgname=pm4py-core
pkgname=python-pm4py
pkgver=2.7.4
pkgrel=1
pkgdesc="State-of-the-art-process mining in Python"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pm4py/pm4py-core"
license=('GPL3')
groups=()
depends=(
	'python'
	'python-cvxopt'
	'python-deprecation'
	'python-graphviz'
	'python-intervaltree'
	'python-lxml'
	'python-matplotlib'
	'python-networkx'
	'python-numpy'
	'python-pandas'
	'python-pyarrow'
	'python-pydotplus'
	'python-pytz'
	'python-scipy'
	'python-stringdist'
	'python-tqdm'
	'glpk'
	)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pyemd' 'python-pyvis')
optdepends=('python-scikit-learn' 'python-pyemd' 'python-pyvis' 'python-jsonschema' 'python-polars')
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
noextract=()
sha512sums=('528df33cded6cd751773f80af9a21893eab5d9639e3857ffbd1458a0fbd408d9a15045d4ec94675a766bf93891f26f0df772b2b629529b7c7f7f8f041be97a7e')

build() {
	cd "$srcdir/${_archive}"
	python setup.py build
}

check() {
	cd "$srcdir/${_archive}/tests"
	python execute_tests.py
}

package() {
	cd "$srcdir/${_archive}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
