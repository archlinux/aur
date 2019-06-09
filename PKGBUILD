# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python2-sncosmo
_pyname=${pkgbase#python2-}
pkgname=("python2-${_pyname}")
pkgver=1.8.2
pkgrel=1
pkgdesc="Python library for supernova cosmology"
arch=('i686' 'x86_64')
url="https://sncosmo.readthedocs.io/"
license=('BSD')
makedepends=('python2-setuptools' 'python2-numpy')
#checkdepends=('python2-astropy')
#'python2-pytest' 'python2-extinction' 'python-nestle')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3b18d131d1e254b729a978a1a2f0fa38')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python2 setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
#    python2 setup.py test
#}

package_python2-sncosmo() {
    depends=('python2>=2.7' 'python2-astropy' 'python2-extinction')
    optdepends=('python2-matplotlib: For plotting functions'
                'python2-iminuit: For light curve fitting using the Minuit minimizer in sncosmo.fit_lc'
                'python2-emcee: For MCMC light curve parameter estimation in sncosmo.mcmc_lc'
                'python2-nestle: For nested sampling light curve parameter estimation in sncosmo.nest_lc'
                'python2-corner: For plotting results from the samplers sncosmo.mcmc_lc and sncosmo.nest_lc'
                'python2-pytest<3.7: For testing'
                'python2-sncosmo-doc: Documentation for SNCosmo')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
