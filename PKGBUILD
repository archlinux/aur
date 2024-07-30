# Maintainer: a821

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.5.2
_pkgver=5.0.2 # upstream's typo!
pkgrel=1
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL-3.0-or-later')
depends=('bzip2' 'python-pandas' 'xz' 'zlib')
makedepends=('cython' 'python-build' 'python-installer' 'python-setuptools' 'python-wheel')
checkdepends=('python-xarray')
optdepends=('python-xarray: for 3D array support')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$_pkgver.tar.gz")
sha256sums=('5a2cde69ca03b61d1cfc41c3d2f13aa73e090fc17c35d190dd5bfa948fd1680e')

build() {
    cd "${_name}-${_pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${_pkgver}"
    local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-x86_64-cpython-$_pyver" python tests/test_basic.py
}

package() {
    cd "${_name}-${_pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
