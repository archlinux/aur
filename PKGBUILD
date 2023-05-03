# Maintainer: a821

pkgname=python-pyreadr
_name=${pkgname#python-}
pkgver=0.4.7
pkgrel=2
pkgdesc='Reads/writes R RData and Rds files into/from pandas data frames'
arch=('x86_64')
url="https://github.com/ofajardo/pyreadr"
license=('AGPL3')
depends=('bzip2' 'python-pandas' 'xz' 'zlib')
makedepends=('cython' 'python-build' 'python-installer' 'python-wheel')
checkdepends=('python-xarray')
optdepends=('python-xarray: for 3D array support')
source=("$_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7f14db1022030b2751cfbace6f1a16e6ff738ffc150360d694924e8278b9f60d')

build() {
    cd "${_name}-${pkgver}"
    python -m build --wheel --no-isolation
}

check() {
    cd "${_name}-${pkgver}"
    local _pyver=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    PYTHONPATH="$PWD/build/lib.linux-x86_64-cpython-$_pyver" python tests/test_basic.py
}

package() {
    cd "${_name}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

# vim: set ts=4 sw=4 et:
