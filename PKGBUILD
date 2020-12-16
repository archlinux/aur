# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-crds
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=10.3.0
pkgrel=1
pkgdesc="Calibration Reference Data System for HST and JWST"
arch=('i686' 'x86_64')
url="https://hst-crds.stsci.edu/static/users_guide/index.html"
license=('BSD')
makedepends=('python-setuptools')
checkdepends=('python-pytest' 'python-lockfile' 'python-filelock' 'python-mock' 'python-astropy' 'python-nose' 'python-pylint' 'python-yaml')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/spacetelescope/crds/master/LICENSE")
md5sums=('455fff2f5771ee4133158482c9b332d7'
         'eeff2e5869a14213d19ee6776441af35')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    pytest || warning "Tests failed"
}

package_python-crds() {
    depends=('python-filelock' 'python-astropy' 'python-parsley')
    optdepends=('python-crds-doc: Documentation for CRDS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE"
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.rst
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
