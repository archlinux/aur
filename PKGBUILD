# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Jesse Bryan <jesse@winneon.moe>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=nototools-git
pkgver=0.2.13.r26.g1b452b0
pkgrel=1
epoch=1
pkgdesc='Noto fonts support tools and scripts plus web site generation'
url="https://github.com/googlefonts/${pkgname%-git}"
arch=(any)
license=(Apache)
_pydeps=(appdirs
         attrs
         black
         booleanoperations
         brotli
         click
         defcon
         defcon
         fontmath
         fontparts
         fontpens
         fonttools
         fs
         lxml
         mutatormath
         pathspec
         pillow
         pillow
         pyclipper
         pyclipper
         pytz
         regex
         six
         toml
         typed-ast
         ufolib2
         ufonormalizer
         ufoprocessor
         unicodedata2
         zopfli)
depends=(afdko
         cairo
         harfbuzz
         imagemagick
         pango
         psautohint
         python
         "${_pydeps[@]/#/python-}"
         scour)
makedepends=(git python-setuptools-scm)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags --abbrev=7 --match="v*" HEAD |
		sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	python setup.py build
}

package() {
	cd "$pkgname"
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
