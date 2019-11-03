# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg,,}
pkgname=("python-${_pkg,,}")
pkghashver=55af9b67b5f04a1cde30cba013eec31d44874d4f
pkgdate=20191103
pkgver=0.0.1a0_${pkgdate}
pkgrel=1
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt>=6.0.0')
makedepends=('cython' 'python-setuptools')
optdepends=('gmt-coast' 'gmt-dcw' 'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            'python-nbsphinx' 'python-numpydoc')

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/${pkghashver}.tar.gz")
sha256sums=('e2111299a2674427754d37d75fed1c9af107fcb07d8fb493ef09a07f3f89dc3d')

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
