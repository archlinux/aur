# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.8.2
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(babelfont
          brotli
          browserstack-local
          fontmake
          fonttools
          fs # optdepends of fonttols required for [ufo]
          glyphslib
          opentype-sanitizer
          protobuf
          pyaml
          pybrowserstack-screenshots
          pygit2
          pygithub
          requests
          strictyaml
          tabulate
          ttfautohint-py
          unidecode
          vttlib)
depends=(absl-py
         python
         "${_py_deps[@]/#/python-}"
         statmake)
makedepends=(python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('32aad8567c2c41704e74b8ad8080a96ad274d30bd3051d8594d9a6f527061c36')

prepare() {
	cd "$_archive"
	sed -i -e "/setup_requires/s/>=.*'/'/" setup.py
}

build() {
	cd "$_archive"
	python setup.py build
}

package() {
	cd "$_archive"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
