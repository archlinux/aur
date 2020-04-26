# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.6.0.post0
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'gsl')
#checkdepends=('python-pytest'
##             'python2-pytest'
#              'python-matplotlib'
##             'python2-matplotlib'
#              'python-future'
#              python-scipy)
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('7a8f977098dbb1c7450c39d4b4d23ebb')

prepare() {
    cp -a ${srcdir}/${_pyname}-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#   cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py test
#   pytest

#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
#}

package_python2-galpy() {
    depends=('python2-scipy' 'python2-matplotlib' 'python2-future' 'python2-six' 'python2-pytest')
    optdepends=('python-galpy-doc: Documentation for galpy'
                'gsl>=1.14: For some advanced features'
                'python2-astropy: For Quantity support'
                'python2-astroquery: For the Orbit.from_name initialization method'
                'python2-numexpr: For or plotting arbitrary expressions of Orbit quantities'
                'python2-pynbody-git: Foruse of SnapshotRZPotential and InterpSnapshotRZPotential')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-galpy() {
    depends=('python-scipy' 'python-matplotlib' 'python-future' 'python-six' 'python-pytest')
    optdepends=('python-galpy-doc: Documentation for galpy'
                'gsl>=1.14: For some advanced features'
                'python-astropy: For Quantity support'
                'python-astroquery: For the Orbit.from_name initialization method'
                'python-numexpr: For or plotting arbitrary expressions of Orbit quantities'
                'python-pynbody-git: Foruse of SnapshotRZPotential and InterpSnapshotRZPotential')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-galpy-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/${_pyname}-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
