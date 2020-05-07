# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-sunpy-sphinx-theme
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1.2.17
pkgrel=1
pkgdesc="The sphinx theme for the SunPy website and documentation"
arch=('i686' 'x86_64')
url="https://github.com/sunpy/sunpy-sphinx-theme"
license=('BSD')
makedepends=('python-setuptools-scm' 'python2-setuptools-scm')
checkdepends=('python-sphinx' 'python2-sphinx' 'python-sphinx-bootstrap-theme' 'python2-sphinx-bootstrap-theme')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('d2494411d234b24bc8f7ec1704ba1db5')

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
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}
    msg "Checking Python3"
    python setup.py test
#   pytest

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
#   pytest2
}

package_python2-sunpy-sphinx-theme() {
    depends=('python2-sphinx' 'python2-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-sunpy-sphinx-theme() {
    depends=('python-sphinx' 'python-sphinx-bootstrap-theme')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
