# Maintainer: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=0.4.1
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py')
makedepends=('python-setuptools')
checkdepends=('python-netcdf4' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoyer/h5netcdf/archive/v${pkgver}.tar.gz")
sha256sums=('a5f8e9c27087ed02286f06c1d07d68d34ab94854e5f423caa5f41e23da4a1d06')

build() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py build
}

# As of 2017-10-02, two failures occur, but this seems to be a problem with
# netcdf-c?  See https://github.com/shoyer/h5netcdf/issues/31
# check() {
#     cd "$srcdir/h5netcdf-${pkgver}"
#     PYTHONPATH="./build/lib" pytest -v
# }

package() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
