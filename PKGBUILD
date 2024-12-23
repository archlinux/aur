# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=fontdiffenator
pkgver=0.9.13
pkgrel=4
pkgdesc='Font regression tester for Google Fonts'
arch=(any)
url="https://github.com/googlefonts/$pkgname"
license=(Apache-2.0)
_py_deps=(fonttools
          pillow
          cairo
          uharfbuzz
          freetype-py)
depends=(python
         "${_py_deps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.tar.gz")
sha256sums=('6735b98ec54dbc17974dc6fb92febbb3b0cc08174d0cc6cbad970a2925f282f9')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
