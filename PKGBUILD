# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-naima
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
#"python-${_pyname}-doc")
pkgver=0.9.1
pkgrel=1
pkgdesc="Derivation of non-thermal particle distributions through MCMC spectral fitting"
arch=('i686' 'x86_64')
url="https://naima.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools-scm')
#'python-astropy' 'python-astropy-helpers>=3.1' 'python-sphinx-astropy' 'python-emcee')
checkdepends=('python-pytest' 'python-astropy' 'python-corner' 'python-emcee<3.0' 'python-sherpa')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f37556c140f1cfa38bc8aa2077728229')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

    sed -i -e '/auto_use/s/True/False/' setup.cfg
}

build() {
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_sphinx
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest
}

package_python-naima() {
    depends=('python>=3.5' 'python-astropy>=1.0.2' 'python-emcee<3.0' 'python-corner' 'python-yaml')
    optdepends=('python-sherpa: For using Sherpa models'
                'python-naima-doc: Documentation for Naima')
#               'python-pytest-astropy: For testing'
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-naima-doc() {
#    pkgdesc="Documentation for Python Naima module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
