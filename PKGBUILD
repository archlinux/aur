# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: gardar <aur@gardar.net>
# Contributor: Morten Linderud <morten@linderud.pw>  

pkgbase="python-testinfra"
pkgname="python-testinfra"
_pkgname='testinfra'
pkgver=4.0.0
pkgrel=1
pkgdesc='Testinfra test your infrastructures'
url='https://github.com/philpep/testinfra'
arch=('any')
license=('Apache')
depends=('python-six')
makedepends=('python' 'python-setuptools' 'python-pbr' 'python-sphinx')
source=("git+https://github.com/philpep/testinfra.git#tag=$pkgver")
sha256sums=('SKIP')


build() {
    cd "${_pkgname}"
    python setup.py build
    make -C doc html man
}

package() {
    cd "${_pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    cp -r doc/build/html/* "${pkgdir}/usr/share/doc/${pkgname}"
    install -Dm 644 doc/build/man/testinfra.1 "${pkgdir}/usr/share/man/man1/${pkgname}.1"
}

# vim:set ft=sh ts=2 sw=2 et:
