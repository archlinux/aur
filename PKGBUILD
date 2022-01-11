# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.8.6
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
          jinja
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
sha256sums=('5ca8555273bafef58ee8c842ed2e7f27ba4dd305666903ee8214b521f6cb3912')

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
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
