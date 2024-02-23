# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=ygt
pkgver=0.2.5
pkgrel=1
pkgdesc='A graphical hint editor for TrueType fonts'
arch=(any)
url="https://github.com/psb1558/$pkgname"
license=(Apache-2.0)
_pydeps=(defcon
         fonttools
         freetype-py
         fs # fonttools[ufo]
         numpy
         pyqt6
         pyyaml
         schema
         ufo2ft
         uharfbuzz
         xgridfit)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(python-{build,installer,wheel}
             python-setuptools)
_archive="$pkgname-$pkgver"
source=("$_archive.tgz::$url/archive/v$pkgver.tar.gz")
sha256sums=('112a915bc3381f60e6594a072c549ed4e3e275d607d76ac2b51cca835b530a60')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}

