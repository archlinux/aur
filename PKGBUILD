# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontbakery
pkgver=1.1.0
pkgrel=1
pkgdesc='A command-line tool for checking the quality of font projects'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(axisregistry
         beautifulsoup4
         beziers
         cmarkgfm
         collidoscope
         defcon
         fonttools
         fs # for fonttols[ufo]
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
         unicodedata2 # for fonttools[unicode]
         vharfbuzz)
depends=(dehinter
         font-v
         python
         ttfautohint
         ufolint)
depends+=("${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
# source=("$url/archive/v$pkgver/$_archive.tar.gz")
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('70b40d8eba64f26dd19b55410b814d181edefc4fa18c8a9c4ad1520ea7d5224e')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
