# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
pkgname=('python-galpy' 'python2-galpy')
pkgver=1.4.0
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io/"
license=('BSD')
makedepends=('python-scipy' 'python2-scipy' 'python-matplotlib' 'python2-matplotlib')
source=("https://files.pythonhosted.org/packages/source/g/galpy/galpy-${pkgver}.tar.gz")
md5sums=('aa4f679050a0b5c69c87f4bc69d52a61')

prepare() {
    cd ${srcdir}/galpy-${pkgver}

    cp -a ${srcdir}/galpy-${pkgver}{,-py2}
}

build() {
    msg "Building Python2"
    cd ${srcdir}/galpy-${pkgver}-py2
    python2 setup.py build

    msg "Building Python3"
    cd ${srcdir}/galpy-${pkgver}
    python setup.py build

#   msg "Building Docs"
#   python setup.py build_docs
}

#check() {
#    cd ${srcdir}/galpy-${pkgver}
#    python setup.py test
#
#    cd ${srcdir}/galpy-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-galpy() {
    depends=('python2-scipy' 'python2-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy')
    cd ${srcdir}/galpy-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-galpy() {
    depends=('python2-scipy' 'python2-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy')
    cd ${srcdir}/galpy-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

#package_python-galpy-doc() {
#    pkgdesc="Documentation for Python Radio Beam module"
#    cd ${srcdir}/galpy-${pkgver}/docs/_build
#
#    install -d -m755 "${pkgdir}/usr/share/doc/${pkgbase}"
#    cp -a html "${pkgdir}/usr/share/doc/${pkgbase}"
#}
