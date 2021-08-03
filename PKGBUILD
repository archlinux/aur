# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>

pkgname=python-fontmake
_pyname=${pkgname#python-}
pkgver=2.4.0
pkgrel=2
pkgdesc='Compile fonts from sources (UFO, Glyphs) to binary (OpenType, TrueType)'
arch=(any)
url="https://github.com/googlefonts/$_pyname"
license=(Apache)
_pydeps=(attrs
         compreffor # for ufo2ft[compreffor]
         cu2qu
         defcon
         fontmath
         fonttools
         fs # for fonttools[ufo]
         glyphslib
         lxml # for fonttools[lxml]
         ufo2ft
         ufolib2
         unicodedata2) # for fonttools[unicode]
depends=(python
         "${_pydeps[@]/#/python-}")
checkdepends=(python-mutatormath
              python-pytest)
makedepends=(python-setuptools-scm)
optdepends=(python-mutatormath
            python-skia-pathops)
_archive="$_pyname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${_pyname::1}/$_pyname/$_archive.zip")
sha256sums=('2c14d12e56e7f8dee186c451239a82b55ddffec9931c0d1b09fdd6c1fb81ee23')

build() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=Lib pytest tests
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
