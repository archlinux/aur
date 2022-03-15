# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.9.1
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
          glyphsets
          jinja
          opentype-sanitizer
          protobuf
          pyaml
          pybrowserstack-screenshots
          pygit2
          pygithub
          requests
          skia-pathops
          strictyaml
          tabulate
          ttfautohint-py
          unidecode
          vttlib)
depends=(absl-py
         hyperglot
         python
         "${_py_deps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer}
             python-setuptools-scm
             python-wheel)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('fcf646ed8e5c49465dcc55107d31ac99485e97a29332b18a71afbeb2f9239d5d')

prepare() {
	cd "$_archive"
    sed -i -e "/setup_requires/s/>=.*'/'/" setup.py
}

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
