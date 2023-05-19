# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=diffenator2
pkgver=0.2.2
pkgrel=1
pkgdesc='Compare two font families, descendent of fontdiffenator'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=()
_pydeps=(blackrenderer # [skia]
         fonttools
         freetype-py
         gflanguages
         glyphsets
         jinja
         numpy # for blackrenderer[ska]
         pillow
         protobuf
         selenium
         skia # for blackrenderer[ska]
         tqdm
         uharfbuzz
         pyahocorasick
         unicodedata2
         youseedee)
depends=(ninja
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-poetry-{core,dynamic-versioning})
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('eaea2da7506ac22986e1c0a20a25d6ec6dfc6ff0c72fbae5fdf05fd748a6a191')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
