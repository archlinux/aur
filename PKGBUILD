# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.8.5
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
sha256sums=('127982310dcf7d95af4f93767054cf6e00aec521c6ad908d06d5b90d53854364')

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
