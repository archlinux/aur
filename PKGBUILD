# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=python-fonttools-git
pkgver=4.24.4.r1.gee2aa26
pkgrel=1
pkgdesc='A library to manipulate font files from Python'
url='https://github.com/fonttools/fonttools'
license=(MIT)
arch=(x86_64)
depends=(python)
makedepends=(cython git python-setuptools)
optdepends=('python-brotli: to compress/decompress WOFF 2.0 web fonts'
            'python-fs: to read/write UFO source files'
            'python-lxml: faster backend for XML files reading/writing'
            'python-lz4: for graphite type tables in ttLib/tables'
            'python-matplotlib: for visualizing DesignSpaceDocument and resulting VariationModel'
            'python-pyqt5: for drawing glyphs with Ql’s QPainterPath'
            'python-reportlab: to drawing glyphs as PNG images'
            'python-scipy: for finding wrong contour/component order between different masters'
            'python-sympy: for symbolic font statistics analysis'
            'python-unicodedata2: for displaying the Unicode character names when dumping the cmap table with ttx'
            'python-zopfli: faster backend fom WOFF 1.0 web fonts compression')
provides=("${pkgname%-git}=$pkgver")
conflicts=("${pkgname%-git}")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    git describe --long --tags --abbrev=7 HEAD |
        sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    python setup.py build_ext --inplace
    python setup.py build
}

package() {
    cd "$pkgname"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dpm755 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}

