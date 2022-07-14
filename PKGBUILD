# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_pyname=panflute
pkgname=python-$_pyname
pkgver=2.2.3
pkgrel=1
pkgdesc='A Pythonic alternative to John MacFarlane’s pandocfilters'
arch=(any)
url="https://github.com/sergiocorreia/$_pyname"
license=(BSD)
_pydeps=(click
         yaml)
depends=(pandoc
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_pycheckdeps=(pandocfilters
              pytest
              pytest-cov)
checkdepends=("${_pycheckdeps[@]/#/python-}")
provides=("pandoc-$_pyname=$pkgver")
conflicts=("pandoc-$_pyname")
replaces=("pandoc-$_pyname")
_archive="$_pyname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('262d77ea3296e5482d3fce5eaa525bc7bd5d19260d57e2248f30472253a9a34c')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH="$PWD" pytest \
		--deselect tests/test_panfl.py::test_pandoc_call
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
