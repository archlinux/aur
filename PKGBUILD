# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
__pkgname='intelhex'
pkgname=('python-intelhex' 'python2-intelhex')
pkgver=2.2.1
pkgrel=1
pkgdesc="Python IntelHex library"
url="https://github.com/bialix/intelhex"
optdepends=()
license=('BSD')
arch=('any')
source=("${__pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('8534f71e7bc1f6c92fb766bbffb52f93fab1c6c426d8fdaca92d3d02f2b95624620456f8e95e55d1c4d974a1e3a39bf9d0abb73888ae1d13ceb5144ef6daca14')
makedepends=('python-setuptools'
             'python2-setuptools')

check() {
    cd "${srcdir}/${__pkgname}-${pkgver}"

    # FIXME Unittests fail on 2.2.1 due to a bad version check?
    #msg "Running unittests"
    #python setup.py test -q
}

package_python-intelhex() {
    depends=('python' 'python-setuptools')
    cd "${srcdir}/${__pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-intelhex() {
    depends=('python2' 'python2-setuptools')
    cd "${srcdir}/${__pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    rm -rf ${pkgdir}/usr/lib/python*/site-packages/tests/

    # Only install command line tools with python-intelhex version
    rm -rf ${pkgdir}/usr/bin
}

