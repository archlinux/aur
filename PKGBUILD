# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg,,}
pkgname=("python-${_pkg,,}")
pkghashver=997b88c855c12ffacd2c4b911f3fa83244ce8d7b
pkgver=0.0.1a0_${pkghashver}
pkgrel=4
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt6')
makedepends=('cython' 'python-setuptools')
optdepends=('gmt-coast' 'gmt-dcw' 'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            'python-nbsphinx' 'python-numpydoc')

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/${pkghashver}.tar.gz")
sha256sums=('990145de2d61df5d02f784e406a217138ee029f559454bcf7eb12a28f6258a60')

build() {
    cd ${_pkg}-${pkghashver}
    USE_NCCONFIG=1 python setup.py build
}

#check() {
#    depends=('ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
#             'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
#             'python-black' 'python-pylint' 'flake8' 'python-sphinx'
#             'python-sphinx_rtd_theme' 'python-sphinx-gallery'
#             'python-nbsphinx' 'python-numpydoc')
#    cd ${_pkg}-${pkghashver}
#    PYTHONPATH="../../build/lib" python -c 'import pygmt;pygmt.test()'
#}

package() {
    cd ${_pkg}-${pkghashver}
    USE_NCCONFIG=1 python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
}
