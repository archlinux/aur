# Contributor: Eli Schwartz <eschwartz@archlinux.org>

_pkgname=chai
pkgbase=python-chai
pkgname=('python-chai' 'python2-chai')
pkgver=1.1.2
pkgrel=1
pkgdesc="Easy to use mocking, stubbing and spying framework."
arch=('any')
url="https://github.com/agoragames/${_pkgname}"
license=('BSD')
makedepends=('python-setuptools' 'python2-setuptools')
checkdepends=('python-nose' 'python2-nose')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('ff8d2b6855f660cd23cd5ec79bd10264d39f24f6235773331b48e7fcd637d6cc')

build() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    python setup.py build
    python2 setup.py build
}

check() {
    cd "${srcdir}"/${_pkgname}-${pkgver}

    nosetests
    nosetests2
}

package_python-chai() {
    depends=('python')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}

package_python2-chai() {
    depends=('python2')

    cd "${srcdir}"/${_pkgname}-${pkgver}
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt
}
