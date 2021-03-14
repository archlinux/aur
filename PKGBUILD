# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg}
pkgname=("python-${_pkg}")
pkgver=0.3.1
pkgrel=1
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt6>=6.1.1')
makedepends=('python-pip' 'cython' 'python-setuptools'
            'gmt-coast' 'gmt-dcw' 'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            'python-nbsphinx' 'python-numpydoc')

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/v${pkgver}.tar.gz")
sha256sums=('b9ea36cdaede22649acdb91efe59c28661514b0f8bc20d410b4ce8dbf6c2279a')

build() {
    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py build
}

check() {
#    depends=('ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
#             'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
#             'python-black' 'python-pylint' 'flake8' 'python-sphinx'
#             'python-sphinx_rtd_theme' 'python-sphinx-gallery'
#             'python-nbsphinx' 'python-numpydoc')
    cd ${_pkg}-${pkgver}
    PYTHONPATH="../../build/lib" python -c 'import pygmt;pygmt.test()'
}

package() {
    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
}
