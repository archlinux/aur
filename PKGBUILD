# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gftools
pkgver=0.7.4
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
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('386bc778b9e8aff55e6c44cb88ef284c326afa149bd6f10bf81399e4efdfaa8e')

build() {
    cd "$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
