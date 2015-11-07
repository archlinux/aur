# Maintainer: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=0.2.2
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py')
makedepends=('python-setuptools')
checkdepends=('python-netcdf4' 'python-pytest')
source=(https://github.com/shoyer/h5netcdf/archive/v${pkgver}.tar.gz)
md5sums=('a98f296e7ef9ba9af91fb6c4c8b16898')

build() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/h5netcdf-${pkgver}"
    PYTHONPATH="./build/lib" py.test -v
}

package() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize 1
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
