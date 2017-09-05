# Maintainer: Morten Linderud <morten@linderud.pw>  
_pkgname='testinfra'
pkgbase="python-testinfra"
pkgname=("python-testinfra" "python2-testinfra")
pkgver=1.6.5
pkgrel=3
pkgdesc='Testinfra test your infrastructures'
url='https://github.com/philpep/testinfra'
arch=('any')
license=('Apache')
makedepends=('python' 'python-setuptools' 'python-pbr' 'python-sphinx'
             'python2' 'python2-setuptools' 'python2-pbr')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/philpep/testinfra/archive/${pkgver}.tar.gz")
sha256sums=('e05a6e19bd57d328d788215ce344b4e0d5543bd518fbab0c0d9bfbb118730c0c')

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PBR_VERSION=$pkgver
    python setup.py build
    python2 setup.py build
    make -C doc html man
}

package_python-testinfra() {
    depends=('python-six')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PBR_VERSION=$pkgver
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r doc/build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 doc/build/man/testinfra.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

package_python2-testinfra() {
    depends=('python2-six')

    cd "${srcdir}/${_pkgname}-${pkgver}"
    export PBR_VERSION=$pkgver
    python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r doc/build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 doc/build/man/testinfra.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}
# vim:set ft=sh ts=2 sw=2 et:
