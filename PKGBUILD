# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=diffenator2
pkgver=0.2.1
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
sha256sums=('2d8df0b03b804d1a79d93a51e6f114cd97d25be58bd9de085473ed80d168ee1b')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
