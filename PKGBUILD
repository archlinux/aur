# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg}
pkgname=("python-${_pkg}")
pkgver=0.6.1
pkgrel=1
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt>=6.2.0')
makedepends=('python-pip' 'cython' 'python-setuptools')
            #'gmt-coast' 'gmt-dcw' 
            #'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            #'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            #'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            #'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            #'python-nbsphinx' 'python-numpydoc' 'python-docformatter'
            #'python-black' 'python-blackdoc' 'dvc' 'python-isort' 
            #'python-myst-parser' 'python-sphinx-copybutton' )

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/v${pkgver}.tar.gz")
sha256sums=('e3d6c3749f5ebed2920ddd12ed455c531ee1eee35c9190aad68806db7d54b8b0')

build() {
    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py build
}

#check() {
##    depends=('ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
##             'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
##             'python-black' 'python-pylint' 'flake8' 'python-sphinx'
##             'python-sphinx_rtd_theme' 'python-sphinx-gallery'
##             'python-nbsphinx' 'python-numpydoc')
#    cd ${_pkg}-${pkgver}
#    PYTHONPATH="../../build/lib" python -c 'import pygmt;pygmt.test()' || true
#}

package() {
    cd ${_pkg}-${pkgver}
    USE_NCCONFIG=1 python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=2
}
