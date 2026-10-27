# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: txtsd <aur.archlinux@ihavea.quest>

pkgname=gftools
pkgver=0.10.5
pkgrel=1
pkgdesc='Misc tools for working with the Google Fonts library'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_pydeps=(axisregistry
         babelfont
         beautifulsoup4
         brotli
         browserstack-local
         bumpfontversion
         fontfeatures
         fontmake
         fonttools
         fs # optdepends of fonttols required for [ufo]
         gflanguages
         gfsubsets
         glyphsets
         glyphslib
         jinja
         networkx
         opentype-sanitizer
         pillow
         protobuf
         pyaml
         pybrowserstack-screenshots
         pygit2
         pygithub
         requests
         rich
         ruamel-yaml
         skia-pathops
         strictyaml
         tabulate
         ttfautohint-py
         typing_extensions
         ufolib2
         unidecode
         vharfbuzz
         vttlib)
depends=(absl-py
         font-v
         hyperglot
         nanoemoji
         ninja
         python
         "${_pydeps[@]/#/python-}"
         statmake)
makedepends=(python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('8e04a761a89157ded7bc59bd1ee00ec6c07f1c1cbaccaaa63e8955de96a65127')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
