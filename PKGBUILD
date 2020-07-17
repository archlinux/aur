# Maintainer: Astro Benzene <universebenzene at sina dot com>
pkgbase=python-stwcs
_pyname=${pkgbase#python-}
pkgname=("python-${_pyname}")
pkgver=1.6.0
pkgrel=1
pkgdesc="WCS based distortion models and coordinate transformation"
arch=('i686' 'x86_64')
url="https://stwcs.readthedocs.io"
license=('BSD')
makedepends=('python-setuptools-scm')
checkdepends=('python-pytest' 'python-stsci.tools' 'python-matplotlib' 'python-lxml' 'python-requests')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('3493a79b7740518c675983496850dcef')

build() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py build
}

check() {
    cd ${srcdir}/${_pyname}-${pkgver}

    python setup.py test
#   ls "${srcdir}/${_pyname}-${pkgver}/build/lib"
#   PYTHONPATH="${srcdir}/${_pyname}-${pkgver}/build/lib" pytest
}

package_python-stwcs() {
    depends=('python>=3.5' 'python-stsci.tools>=3.6' 'python-requests' 'python-lxml')
    optdepends=('python-stwcs-doc: Documentation for STWCS')
    cd ${srcdir}/${_pyname}-${pkgver}

    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
}
