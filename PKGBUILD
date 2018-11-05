# Maintainer: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=0.6.2
pkgrel=1
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py')
makedepends=('python-setuptools')
checkdepends=('python-netcdf4' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoyer/h5netcdf/archive/v${pkgver}.tar.gz")
sha256sums=('9d4aa126c1306860a7bb6381b978effe05941c7121ea748110998c742ebe82bf')

build() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/h5netcdf-${pkgver}"
    PYTHONPATH="./build/lib" pytest -v
}

package() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
