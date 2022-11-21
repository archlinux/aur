# Maintainer: Andrzej Giniewicz <gginiu@gmail.com>
# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Firmicus <firmicus āt gmx dōt net>
# Contributor: flying sheep <flying-sheep@web.de>

pkgname=python38-fonttools
_pyname=${pkgname#python38-}
pkgver=4.38.0
pkgrel=1
pkgdesc='A library to manipulate font files from Python'
url="https://github.com/fonttools/$_pyname"
license=('MIT')
arch=('x86_64')
depends=('python38')
makedepends=('cython'
             'python38-'{build,installer}
             'python38-setuptools'
             'python38-wheel')
checkdepends=('python38-brotli'
              'python38-fs'
              'python38-pytest'
              'python38-ufolib2')
optdepends=('python38-brotli: to compress/decompress WOFF 2.0 web fonts'
            'python38-fs: to read/write UFO source files'
            'python38-lxml: faster backend for XML files reading/writing'
            'python38-lz4: for graphite type tables in ttLib/tables'
            'python38-matplotlib: for visualizing DesignSpaceDocument and resulting VariationModel'
            'python38-pyqt5: for drawing glyphs with Qt’s QPainterPath'
            'python38-reportlab: to drawing glyphs as PNG images'
            'python38-scipy: for finding wrong contour/component order between different masters'
            'python38-sympy: for symbolic font statistics analysis'
            'python38-uharfbuzz: to use the Harfbuzz Repacker for packing GSUB/GPOS tables'
            'python38-unicodedata2: for displaying the Unicode character names when dumping the cmap table with ttx'
            'python38-zopfli: faster backend fom WOFF 1.0 web fonts compression')
source=("$url/archive/$pkgver/$_pyname-$pkgver.tar.gz")
sha256sums=('764c569221fb437d0c3937d19d3e38e137d324f225fb30e54ef0aaa2d6f7a289')

build() {
	cd "$_pyname-$pkgver"
	python3.8 -m build -wn
}

check() {
	cd "$_pyname-$pkgver"
	PYTHONPATH=Lib pytest
}

package() {
	cd "$_pyname-$pkgver"
	python3.8 -m installer -d "$pkgdir" dist/*.whl
	install -Dm0755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
