# Maintainer: Padraic Fanning <fanninpm AT miamioh DOT edu>

_name='flit_scm'
pkgname=python-${_name//_/-}
pkgver=1.6.2
pkgrel=1
pkgdesc="A PEP 518 build backend that uses setuptools_scm to generate a version file from your version control system, then flit to build the package."
arch=('any')
url="https://gitlab.com/WillDaSilva/flit_scm"
license=('MIT')
depends=(
	'python'
	'python-flit-core'
	'python-setuptools-scm'
	'python-tomli'
)
makedepends=(
	'python-build'
	'python-installer'
	'python-wheel'
)
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$_name-$pkgver.tar.gz")
sha256sums=('78afc9d2364e15df9d6ff7f27940e41d43d0d6b7fb659d37a7b2df1f1c97ad66')

build() {
    cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
