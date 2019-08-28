# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.distutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=0.3.7
pkgrel=1
pkgdesc="Distutils/packaging-related utilities used by some of STScI's packages"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-d2to1' 'python2-d2to1')
checkdepends=('python2-pytest' 'python2-nose')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('65c866c0444f6a8effe2d41688606a0c')

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
#   cd ${srcdir}/${_pyname}-${pkgver}
#   msg "Checking Python3"
#   python setup.py test

#   msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-stsci.distutils() {
    depends=('python2>=2.7')
    optdepends=('python-stsci.distutils-doc: Documentation for STScI Distutils')
    cd ${srcdir}/${_pyname}-${pkgver}-py2

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-stsci.distutils() {
    depends=('python')
    optdepends=('python-stsci.distutils-doc: Documentation for STScI Distutils')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
