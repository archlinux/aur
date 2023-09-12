# Maintainer: Sean Ho <sean.li.shin.ho@gmail.com>

_pkg=pygmt
pkgbase=python-${_pkg}
pkgname=("python-${_pkg}")
pkgver=0.10.0
pkgrel=2
pkgdesc="Python interface to the Generic Mapping Tools C library"
arch=('x86_64')
url="https://www.pygmt.org"
license=('3-BSD')
depends=('python-numpy' 'python-pandas' 'python-xarray' 'python-netcdf4' 'python-packaging' 'gmt')
makedepends=('python-pip' 'cython' 'python-setuptools' 'python-setuptools-scm')
            #'gmt-coast' 'gmt-dcw' 
            #'ipython' 'python-matplotlib' 'jupyter' 'python-pytest'
            #'python-pytest-cov' 'python-pytest-mpl' 'python-coverage'
            #'python-black' 'python-pylint' 'flake8' 'python-sphinx'
            #'python-sphinx_rtd_theme' 'python-sphinx-gallery'
            #'python-nbsphinx' 'python-numpydoc' 'python-docformatter'
            #'python-black' 'python-blackdoc' 'dvc' 'python-isort' 
            #'python-myst-parser' 'python-sphinx-copybutton' )

source=("https://github.com/GenericMappingTools/${_pkg,,}/archive/v${pkgver}.tar.gz")
sha256sums=('95346786a0a51c03bec1d6ace81a6c5ce98706cc9ffb05c7d77b966a5b85ff79')

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
