# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
__pkgname='intelhex'
pkgname=('python-intelhex' 'python2-intelhex')
pkgver=2.1
pkgrel=4
pkgdesc="Python IntelHex library"
url="https://github.com/bialix/intelhex"
optdepends=()
license=('BSD')
arch=('any')
source=("${__pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha512sums=('af5ee3cb7424d15cf259861dcedf6ca68ecfae0819cb9f5c3437a1c8ff8c2f03486dd9f12b93564a5e2f4b7bab4c055a44c6dbe2a86007165412336bd2a4554f')
makedepends=('python-setuptools'
             'python2-setuptools')

check() {
    cd "${srcdir}/${__pkgname}-${pkgver}"

    msg "Running unittests"
    python setup.py test -q
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

