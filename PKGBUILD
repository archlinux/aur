# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.convolve
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}" "python2-${_pyname}")
pkgver=2.2.2
pkgrel=1
pkgdesc="Image array convolution functions"
arch=('i686' 'x86_64')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools' 'python-numpy' 'python2-numpy' 'python-d2to1' 'python2-d2to1' 'python-stsci.distutils' 'python2-stsci.distutils')
checkdepends=('python2-nose')
#             'python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz"
        "https://github.com/spacetelescope/stsci.convolve/blob/master/LICENSE.txt")
md5sums=('fb0feba75f45d85f34d6e4599efcd3db'
         '7ee1b1760f8eb2c2b2b1946060c73630')
_pyver=$(python -V | cut -c 8-10)

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
#   msg "Checking Python3"
#   cd ${srcdir}/${_pyname}-${pkgver}
#   python setup.py test
#   pytest

#   msg "Checking Python2"
    cd ${srcdir}/${_pyname}-${pkgver}-py2
    python2 setup.py test
}

package_python2-stsci.convolve() {
    depends=('python2-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    python2 setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}

package_python-stsci.convolve() {
    depends=('python-numpy')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/LICENSE.txt"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
