# Maintainer: Markus Richter <mqus at disroot dot org>
_pkgname=pm4py-core
pkgname=python-pm4py
pkgver=2.5.2
pkgrel=1
pkgdesc="State-of-the-art-process mining in Python"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/pm4py/pm4py-core"
license=('GPL2')
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
	'python-pyemd'
	'python-pytz'
	'python-pyvis'
	'python-scipy'
	'python-stringdist'
	'python-tqdm'
	'glpk'
	)
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov')
conflicts=("$pkgname-git")
replaces=()
backup=()
options=()
install=
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz")
noextract=()
sha256sums=('b487fa469efba4efeff1c76922fab30a8dc80050c6d5d557ac5084bdf32a4521')

build() {
	cd "$srcdir/${_archive}"
	python setup.py build
}

check() {
	cd "$srcdir/${_archive}/tests"
	#ln -s "$srcdir/${_archive}/tests/compressed_input_data" ../
	#PYTHONPATH=. py.test --cov pm4py tests
	python execute_tests.py
}

package() {
	cd "$srcdir/${_archive}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
