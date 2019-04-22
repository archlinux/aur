# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
# Contributor: richli <rich at dranek dot com>
# Contributor: rememberthemer <rememberthemer@_GMAIL_DOT_COM_>

_pkg=pygmt
pkgbase=python-${_pkg,,}
pkgname=("python-${_pkg,,}")
pkgver=0.0.1a0
pkgrel=1
pkgdesc="Python/NumPy interface to the netCDF C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
#numpy, pandas, xarray, netCDF4, packaging
makedepends=('cython' 'python-setuptools' 'python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt')
source=("https://files.pythonhosted.org/packages/77/72/5dfc13ff2be531366a735047892f8c99d709f1289c1eb5f4d0f656b35ce6/pygmt-${pkgver}.tar.gz")
sha256sums=('0bba865dea5cedcbac52ece31775ddf9b1c2bf1629e585cd6bc1fce848b09add')

build() {
    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py build
}

#check() {
#    cd ${_pkg}-${pkgver}/pygmt/tests
#    PYTHONPATH="../build/lib.linux-${CARCH}-3.7" python -B ./run_all.py
#}

package() {
    depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt')

    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
}
