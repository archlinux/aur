# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=glyphsets
pkgname=python-${_pyname,,}
pkgver=1.1.0
pkgrel=2
pkgdesc='an API with data about glyph sets for many different scripts and languages'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache-2.0)
_pydeps=(defcon
         fonttools
         fs # for fonttools[ufo]
         glyphslib)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.tar.gz")
sha256sums=('8f36ba550dcf64040f92eda1ca8d0a78ee7dafae10f53a6a2c22347485ff5115')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
