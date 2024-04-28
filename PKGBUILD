# Maintainer: Caleb Maclennan <caleb@alerque.com>

_pyname=glyphsets
pkgname=python-${_pyname,,}
pkgver=0.6.20
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
sha256sums=('50cb3708e51cb83ab7f551b26ea404a17d19b34a9ce7b75c3dfedb12a263a70e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
