# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-relic
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=1.1.2
pkgrel=1
pkgdesc="Maintains version information for git projects"
arch=('i686' 'x86_64')
url="https://github.com/spacetelescope/relic"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-pytest' 'python2-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('5f8124328c523f01a27e3883ee8b5d84')

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
    msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    pytest

    msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    pytest2
}

package_python2-relic() {
    depends=('python2')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-relic() {
    depends=('python')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
