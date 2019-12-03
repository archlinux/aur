# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-gammapy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.15
pkgrel=1
pkgdesc="A Python package for gamma-ray astronomy"
arch=('i686' 'x86_64')
url="https://gammapy.org/"
license=('BSD')
makedepends=('cython' 'python-numpy')
#'python-sphinx-astropy' 'python-sphinx_rtd_theme' 'python-nbsphinx' 'python-sphinx-click' 'python-click' 'python-yaml' 'python-regions' 'python-naima')
checkdepends=('python-pytest'
              'python-healpy'
              'python-reproject'
              'python-regions'
              'python-iminuit'
              'python-sherpa'
              'jupyter-nbformat'
              'python-sphinx'
              'python-yaml'
              'python-click'
              'python-pydantic')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('49b0ef74115dc9e345b1f95e96b390d9')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_docs
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   pytest
}

package_python-gammapy() {
    depends=('python>=3.6' 'python-yaml>=5.1' 'python-astropy>=3.2' 'python-regions>=0.4' 'python-click>=7.0' 'python-pydantic>=1.0')
    optdepends=('python-reproject: For image reprojection'
                'python-iminuit: For fitting by optimization'
                'python-pandas: For working with tables'
                'python-uncertainties: For linear error propagation'
                'python-matplotlib: For plotting'
                'python-emcee: For fitting by MCMC sampling'
                'python-corner: For MCMC corner plots'
                'python-healpy: For HEALPIX data handling'
                'python-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python-pytest-astropy: For testing'
                'python-sherpa: For modelling and fitting'
                'python-parfive: For example data and tutorial notebook download')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-gammapy-doc() {
#    pkgdesc="Documentation for Gammapy"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
