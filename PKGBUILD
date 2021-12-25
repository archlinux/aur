# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stsci.distutils
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=0.3.7
pkgrel=1
pkgdesc="Distutils/packaging-related utilities used by some of STScI's packages"
arch=('any')
url="http://www.stsci.edu/institute/software_hardware/pyraf/stsci_python"
license=('BSD')
makedepends=('python-setuptools' 'python-d2to1')
#checkdepends=('python-pytest')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('65c866c0444f6a8effe2d41688606a0c')


build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

#check() {
#    cd ${srcdir}/${_pyname}-${pkgver}
#
##   python setup.py test
##   pytest
#
#}

package_python-stsci.distutils() {
    depends=('python')
    optdepends=('python-stsci.distutils-doc: Documentation for STScI Distutils')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 README.txt -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
