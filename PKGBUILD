# Maintainer: sasvari
# Maintainer: nullableVoidPtr <nullableVoidPtr _ gmail _ com>

pkgname=python-camelot-git
pkgver=v0.8.2.r26.g7709e58
pkgrel=4
pkgdesc="Camelot: PDF Table Extraction for Humans"
arch=('any')
url='https://camelot-py.readthedocs.io'
license=('MIT')
depends=('python' 'tk' 'ghostscript' 'opencv' 'python-chardet' 'python-click' 'python-matplotlib'
         'python-numpy' 'python-openpyxl' 'python-pandas' 'python-pdfminer.six'
         'python-pypdf2')
makedepends=('git' 'python-setuptools')
checkdepends=('python-pytest' 'python-pytest-cov' 'python-pytest-mpl')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($pkgname::git://github.com/camelot-dev/camelot.git)
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build () {
    cd "$srcdir/$pkgname"
	python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
	export PYTHONHASHSEED=0
	python setup.py install --root="$pkgdir"
}

check(){
    cd "$srcdir/$pkgname"
    pytest
}
