# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontbakery
pkgver=0.8.10
pkgrel=1
pkgdesc='A command-line tool for checking the quality of font projects'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(axisregistry
          beautifulsoup4
          beziers
          cmarkgfm
          collidoscope
          defcon
          fonttools
          fs # optdepends of fonttols required for [ufo]
          gflanguages
          glyphsets
          lxml
          opentype-sanitizer
          protobuf
          pyyaml
          requests
          rich
          stringbrewer
          toml
          ufo2ft
          unicodedata2 # optdepends of fonttools required for [unicode]
          vharfbuzz)
depends=(dehinter
         font-v
         python
         ttfautohint
         ufolint)
depends+=("${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel} python-setuptools-scm)
_archive="$pkgname-$pkgver"
# source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('50838d85d9f17ac14578d48a9074e7a03d3bccc2e706d7e217455734444e31e0')

build() {
    cd "$_archive"
    python -m build -wn
}

package() {
    cd "$_archive"
    python -m installer -d "$pkgdir" dist/*.whl
}
