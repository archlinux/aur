# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontbakery
pkgver=0.7.38
pkgrel=1
pkgdesc='A command-line tool for checking the quality of font projects'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache)
_py_deps=(beautifulsoup4
          defcon
          fonttools
          lxml
          fs # optdepends of fonttols required for [ufo]
          opentype-sanitizer
          protobuf
          requests
          unicodedata2) # optdepends of fonttools required for [unicode]
depends=(python
         font-v
         ttfautohint
         ufolint)
depends+=("${_py_deps[@]/#/python-}")
makedepends=(python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
sha256sums=('9eaa2b0b43df278cc0eef4fcb4561573ca55ba9da9e99626f0a33ae5f22d807e')

prepare() {
    cd "$pkgname-$pkgver"
    echo "version = '$pkgver'" > "Lib/$pkgname/_version.py"
    sed -i -e '/use_scm_version/d' setup.py
}

build() {
    cd "$_archive"
    python setup.py build
}

package() {
    cd "$_archive"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
