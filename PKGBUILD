# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8.9
pkgrel=1
pkgdesc="Reads and writes spatial data files"
arch=('x86_64')
url="https://github.com/Toblerity/Fiona"
license=('BSD')
checkdepends=('python-boto3' 'python-click-plugins' 'python-pytest')
depends=('python' 'python-six' 'python-cligj' 'python-munch' 'gdal')
makedepends=('cython')
optdepends=('python-click-plugins: for fio command line tool.')
options=(!emptydirs)
source=("https://github.com/Toblerity/Fiona/archive/$pkgver.tar.gz")
sha256sums=('c1dcdf3813090519b14cbf557dcfbe97b452722be473530edbccbdfc81601df5')

check() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py build_ext --inplace
    pytest -m "not wheel"
}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
