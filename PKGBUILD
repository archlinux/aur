# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8.6
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
sha256sums=('b6966598725030379f1b0c34e5517941c1b14b32e2a87222c2e585c881c934d8')

check() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py build_ext --inplace
    pytest -m "not wheel"
}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
