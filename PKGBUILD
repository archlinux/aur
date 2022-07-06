# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fontmake
_pyname=${pkgname#python-}
pkgver=3.4.0
pkgrel=1
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(attrs
         fontmath
         fonttools
         fs # for fonttools[ufo]
         glyphslib
         lxml # for fonttools[lxml] and defcon[lxml]
         ttfautohint-py
         ufo2ft
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-compreffor
              python-defcon
              python-mutatormath
              python-pytest
              python-skia-pathops)
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
optdepends=(python-mutatormath
            python-skia-pathops)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('83f253998134efca8015c4d50ae995bc68fae4b6e70ec08852c15fa959628539')

build() {
	cd "$_archive"
	python -m build -wn
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest tests
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
