# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg}
pkgname=("python-${_pkg}")
pkgver=0.13.0
pkgrel=2
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt' 'ghostscript')
makedepends=('python-pip' 'cython' 'python-setuptools' 'python-setuptools-scm' 'python-build' 'python-installer')
            #'gmt-coast' 'gmt-dcw' 
            #'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            #'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            #'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            #'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            #'python-nbsphinx' 'python-numpydoc' 'python-docformatter'
            #'python-black' 'python-blackdoc' 'dvc' 'python-isort' 
            #'python-myst-parser' 'python-sphinx-copybutton' )

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/v${pkgver}.tar.gz")
sha256sums=('2efd4ffbe231f0c2be8d4d0227c8c8500e3dbfdb6d09cb942de7238b75584e75')

build() {
    cd ${_pkg}-${pkgver}
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m build -nw
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
    export SETUPTOOLS_SCM_PRETEND_VERSION=$pkgver
    python -m installer --destdir="$pkgdir" dist/*.whl
}
