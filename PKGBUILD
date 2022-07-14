# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Michael M. Tung <mtung at mat dot upv dot es>

_pyname=panflute
pkgname=python-$_pyname
pkgver=2.2.1
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
sha256sums=('6dff90cb986ba1cc29830e0782d3e3f0a5e9add73c6bcfa9c2d5368b2a8921e0')

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
