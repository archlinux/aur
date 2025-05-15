# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools
pkgname=python-foundrytools
pkgver=0.1.4
pkgrel=1
pkgdesc='A library to work with fonts in Python (exctracted from ftcli)'
arch=(any)
url="https://github.com/ftCLI/$_upname"
license=(MIT)
_pydeps=(cffsubr
         brotli # for fonttools[woff]
         defcon
         fonttools # needs [woff,pathops,unicode]
         ttfautohint-py
         ufo-extractor
         ufo2ft
         skia-pathops # for fonttools[pathops]
         zopfli) # for fonttools[woff]
depends=(afdko
         dehinter
         python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('0c4c811339c24d9a4aad3196148e4232ef30f3dfa5d573bf621b75ce15a66b08')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
