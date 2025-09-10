# Maintainer: dobedobedo <dobe0331 at gmail dot com>
_pkgname='pymcr'
_pkgfolder='pyMCR'
pkgname=("python-$_pkgname")
pkgver=0.5.1
pkgrel=3
pkgdesc="Multivariate Curve Resolution in Python."
arch=('x86_64')
depends=('python'
         'python-numpy'
         'python-scipy'
	    )
makedepends=('python-build' 
	     'python-installer' 
	     'python-wheel' 
	     'python-setuptools'
             'python-pytest')
optdepends=('python-scikit-learn: Provide more efficient regression methods')
url='https://github.com/usnistgov/pyMCR'
license=('custom')
sha256sums=('cefa25c5cc788e466c074aa562baf9f0a91f73bf7d37b04ca82ff2604cc3bf2e')
_source_url="https://files.pythonhosted.org/packages/41/2f/9aa68ca89facba9efab95fdfe38c0368b6ccc1124088986ec3c050e9ea17"
source=("$_source_url/pyMCR-$pkgver.tar.gz")

prepare() {
    cd "$srcdir/$_pkgfolder-$pkgver/"
    sed -i 's/_np.alltrue/_np.all/g' pymcr/constraints.py
    sed -i 's/_np.in1d/_np.isin/g' pymcr/constraints.py
}

build() {
    cd "$srcdir/$_pkgfolder-$pkgver/"
    python -m build --wheel --no-isolation
}

check(){
    cd "$srcdir/$_pkgfolder-$pkgver/"
    pytest
}

package() {
    cd "$srcdir/$_pkgfolder-$pkgver/"
    python -m installer --destdir="$pkgdir" dist/*.whl
} 
