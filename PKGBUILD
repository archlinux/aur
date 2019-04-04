# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-gammapy
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.10
pkgrel=1
pkgdesc="A Python package for gamma-ray astronomy"
arch=('i686' 'x86_64')
url="https://gammapy.org/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-numpy' 'python2-astropy-helpers')
#'python-sphinx-astropy' 'python-nbsphinx' 'python-sphinx-click' 'python-click' 'python-regions')
#checkdepends=('python-pytest-astropy'
#              'python2-pytest'
#              'python-astropy'
#              'python2-yaml'
#              'python-yaml'
#              'python2-click'
#              'python-click'
#              'python2-regions'
#              'python-regions'
#              'python2-astropy-healpix'
#              'python-astropy-healpix')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('bb635dd4c923a89920f37bc3061b2812')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python2 setup.py build --use-system-libraries --offline

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#   msg "Checking Python2"
#   cd ${srcdir}/${pyname}-${pkgver}
#   python2 setup.py test
#}

package() {
    depends=('python2>=2.7' 'python2-yaml' 'python2-astropy>=1.0.2' 'python2-regions' 'python2-click' 'python2-pytest32' 'python2-astropy-healpix')
    optdepends=('python2-reproject: For numerical methods'
#               'python2-yaml: For YAML data handling (config and results files)'
                'python2-iminuit: For fitting by optimization'
                'python2-uncertainties: For linear error propagation'
                'python2-matplotlib: For plotting'
                'python2-emcee: For fitting by MCMC sampling'
                'python2-healpy: For HEALPIX data handling'
                'python2-naima: For SED modeling'
#               'python-gammapy-doc: Documentation for Gammapy'
#               'python2-pytest<3.7: For testing'
                'python2-sherpa: For modelling and fitting')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 licenses/* -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1 --use-system-libraries --offline
    mv ${pkgdir}/usr/bin/gammapy{,2}
}
