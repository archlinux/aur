# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-galpy
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
#"python-${_pyname}-doc")
pkgver=1.4.1
pkgrel=1
pkgdesc="Galactic Dynamics in python"
arch=('i686' 'x86_64')
url="http://galpy.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('f7d5bf5b4d7c963379a89c35ca8acafc')

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
#    cd ${srcdir}/${_pyname}-${pkgver}
#    python setup.py test
#
#    cd ${srcdir}/${_pyname}-${pkgver}-py2
#    python2 setup.py test
#}

package_python2-galpy() {
    depends=('python2-scipy' 'python2-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README* -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-galpy() {
    depends=('python-scipy' 'python-matplotlib')
    optdepends=('python-galpy-doc: Documentation for galpy')
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
