# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8.11
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
source=("$pkgname-$pkgver.tar.gz::https://github.com/Toblerity/Fiona/archive/$pkgver.tar.gz")
sha256sums=('ed500919912f60a3b0d1be6bbb9ec44c683bcd1c9d16ad01f7cc29f7c8477cca')

check() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py build_ext --inplace
    pytest -m "not wheel"
}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
