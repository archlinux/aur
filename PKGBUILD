# Maintainer: Caleb Maclennan <caleb@alerque.com>

_upname=FoundryTools
pkgname=python-foundrytools
pkgver=0.1.8
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
             python-uv-build)
_archive="$_upname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('514cf730301dcf99ba23777a0551c676f9d4e8ea3b07b8bc0a33c906f8515c0f')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
	install -Dm0644 -t "$pkgbase/usr/share/licenses/$pkgname/" LICENSE
}
