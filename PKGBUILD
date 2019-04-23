# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg,,}
pkgname=("python-${_pkg,,}")
pkghashver=f42da4382629015c568612f045f749fc2c6bd1a1
pkgver=0.0.1a0_${pkghashver}
pkgrel=1
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
#numpy, pandas, xarray, netCDF4, packaging
makedepends=('cython' 'python-setuptools' 'python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt>=6.0.0' 'gmt-coast' 'gmt-dcw')
#makedepends=('cython' 'python-setuptools' 'python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt>=6.0.0' 'gmt-coast' 'gmt-dcw'
#             'ipython' 'python-matplotlib' 'jupyter' 'python-pytest' 'python-pytest-cov' 'python-pytest-mpl' 'python-coverage' 'python-black' 'python-pylint' 'flake8' 'python-sphinx'
#             'python-sphinx_rtd_theme' 'python-sphinx-gallery' 'python-nbsphinx' 'python-numpydoc')
source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/${pkghashver}.tar.gz")
sha256sums=('d2acb07c2d3ab5eb2ed16de99101057c45196c9d208e91884c8d5f42d2d10972')

build() {
    cd ${_pkg}-${pkghashver}
    USE_NCCONFIG=1 python setup.py build
}

#check() {
#    cd ${_pkg}-${pkghashver}
#    PYTHONPATH="../../build/lib" python -c 'import pygmt;pygmt.test()'
#}

package() {
    depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt>=6.0.0' 'gmt-coast' 'gmt-dcw')

    cd ${_pkg}-${pkghashver}
    USE_NCCONFIG=1 python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
}
