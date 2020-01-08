# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-extinction
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=0.4.2
pkgrel=1
pkgdesc="Fast interstellar dust extinction laws in Python"
arch=('i686' 'x86_64')
url="http://extinction.readthedocs.io/"
license=('MIT')
makedepends=('cython' 'cython2' 'python-numpy' 'python2-numpy')
#checkdepends=('python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('a79209dc264c4d1a4a1c4fcbc37ec611')

prepare() {
    cd ${srcdir}/${_pyname}-${pkgver}

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
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-extinction() {
    depends=('python2-numpy>=1.13.3')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-extinction() {
    depends=('python-numpy>=1.13.3')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
