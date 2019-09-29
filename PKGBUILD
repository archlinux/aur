# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8.8
pkgrel=1
pkgdesc="Reads and writes spatial data files"
arch=('x86_64')
url="https://github.com/Toblerity/Fiona"
license=('BSD')
checkdepends=('python-boto3' 'python-click-plugins' 'python-pytest')
depends=('python' 'python-six' 'python-cligj' 'python-munch' 'gdal<3')
makedepends=('cython')
optdepends=('python-click-plugins: for fio command line tool.')
options=(!emptydirs)
source=("https://github.com/Toblerity/Fiona/archive/$pkgver.tar.gz")
sha256sums=('2072010f72953bd1005a5b92fac84725ce8cf77a2581bac0dfe99613fa0d57c8')

check() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py build_ext --inplace
    pytest -m "not wheel"
}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
