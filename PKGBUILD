# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=nanoemoji
pkgver=0.12.1
pkgrel=1
pkgdesc='A wee tool to build color fonts'
arch=(any)
url="https://github.com/googlefonts/$_pkgname"
license=(Apache)
_py_deps=(cffsubr # optdepends of ufo2ft required for [cffsubr]
          fonttools
          fs # optdepends of fonttols required for [ufo]
          lxml
          pillow
          regex
          toml
          ufo2ft
          ufolib2)
depends=(absl-py
         ninja
         picosvg
         python
         "${_py_deps[@]/#/python-}")
makedepends=(python-setuptools-scm)
optdepends=('resvg: Support CBDT and sbix color fonts')
checkdepends=(python-pytest)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('43ee888412cbec1e7c31dcfa9c96827b87ad1a914c3d77acf72f3684315c53fd')

build() {
	cd "$_archive"
	python setup.py build
}

check() {
	cd "$_archive"
	PYTHONPATH=build/lib pytest \
		--deselect tests/nanoemoji_test.py
}

package() {
	cd "$_archive"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
