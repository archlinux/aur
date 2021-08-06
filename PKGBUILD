# Maintainer: Achmad Fathoni<fathoni(dot)id(at)gmail(dot)com>
pkgname=python-ouster-sdk
_pkgname=${pkgname:7}
pkgver=0.2.2
pkgrel=1
pkgdesc="Ouster sensor SDK"
arch=(any)
url="https://pypi.org/project/ouster-sdk/"
license=('BSD-3-Clause License')
makedepends=('python-setuptools' 'python-pytest' 'pybind11' 'jsoncpp' 'cmake' 'eigen' 'python-wheel')
depends=('python' 'python-typing_extensions')
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha256sums=('a983065fc28e8f572f395a0f502b28969d585427554531c8be94d57cfa338117')

check(){
    cd ${srcdir}/${_pkgname}-${pkgver}
    python setup.py pytest
}

package() {
    cd ${srcdir}/${_pkgname}-${pkgver}

    python setup.py install --root=${pkgdir} --prefix=/usr --optimize=1
    install -D -m644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
