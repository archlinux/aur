# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
pkgname=python-fiona
pkgver=1.8.13
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
sha256sums=('eae2af4e2822558851bd1ed6e331420faa1b76eaffc750180d7c6db03a660ef9')

check() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py build_ext --inplace
    pytest -m "not wheel"
}

package() {
    cd "$srcdir/Fiona-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
