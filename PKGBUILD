# Maintainer: richli <rich at dranek dot com>

pkgname=python-h5netcdf
pkgver=0.7.4
pkgrel=2
pkgdesc="Pythonic interface to netCDF4 via h5py"
arch=('any')
url="https://github.com/shoyer/h5netcdf"
license=('BSD')
depends=('python-h5py')
makedepends=('python-setuptools')
checkdepends=('python-netcdf4' 'python-pytest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/shoyer/h5netcdf/archive/v${pkgver}.tar.gz"
        "pytest-5.patch")
sha256sums=('9c53363f05e76a6913f259abb8013e7e6173b0e60af6455a2c1ea1750a1524e9'
            'e0cf10dc5faa80f5fb91f83b1a8fb434356ed187e13c554f553333c3e3e49406')

prepare() {
    cd "$srcdir/h5netcdf-${pkgver}"
    # https://aur.archlinux.org/packages/python-h5netcdf/#comment-712212
    # https://github.com/shoyer/h5netcdf/issues/61
    patch --forward --strip=2 --input="${srcdir}/pytest-5.patch"
}

build() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py build
}

check() {
    cd "$srcdir/h5netcdf-${pkgver}"
    PYTHONPATH="./build/lib" pytest -v --disable-warnings
}

package() {
    cd "$srcdir/h5netcdf-${pkgver}"
    python setup.py install --prefix=/usr --root="$pkgdir" --skip-build --optimize 1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: set et sw=4 ts=4 sts=4:
