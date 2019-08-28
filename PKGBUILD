# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.tools
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=3.6.0
pkgrel=1
pkgdesc="Collection of STScI utility functions"
arch=('i686' 'x86_64')
url="https://stscitools.readthedocs.io/"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-relic' 'python2-relic')
checkdepends=('python-pytest-doctestplus' 'python-astropy' 'tk')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('6c3db13921475d8a17c57c75263501a0')

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
#   msg "Checking Python3"
    cd ${srcdir}/${_pyname}-${pkgver}
    python setup.py test

#   msg "Checking Python2"
#   cd ${srcdir}/${_pyname}-${pkgver}-py2
#   python2 setup.py test
}

package_python2-stsci.tools() {
    depends=('python2-astropy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    mv ${pkgdir}/usr/bin/convertlog{,2}
    mv ${pkgdir}/usr/bin/convertwaiveredfits{,2}
}

package_python-stsci.tools() {
    depends=('python-astropy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE.md
    install -D -m644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
