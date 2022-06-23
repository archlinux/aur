# Maintainer: a821

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.4.6
pkgrel=1
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL3')
depends=('bzip2' 'python-pandas' 'xz' 'zlib')
makedepends=('cython')
checkdepends=('python-xarray')
optdepends=('python-xarray: for 3D array support')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('343a5cb9fcb9f646010b7b7947f8d4f100aa1dcf3c2ec0e1df79fc419e48e973')

build() {
    cd "${_name}-${pkgver}"
    python setup.py build
}

check() {
    cd "${_name}-${pkgver}"
    python setup.py build_ext --inplace
    python tests/test_basic.py --inplace
}

package() {
    cd "${_name}-${pkgver}"
    python setup.py install --root "${pkgdir}" --optimize=1 --skip-build
}

# vim: set ts=4 sw=4 et:
