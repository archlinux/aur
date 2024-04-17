# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=glyphsets
pkgname=python-${_pyname,,}
pkgver=0.6.19
pkgrel=1
pkgdesc='an API with data about glyph sets for many different scripts and languages'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
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
sha256sums=('bcef60ccc0973e592433d32d46196e9409d08bab9932d254d4da9c3fcc3ab42a')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
