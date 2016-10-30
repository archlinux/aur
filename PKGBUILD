# Maintainer: Adrian Freund <freundadrian@gmail.com>

pkgname=('python-javascriptcore-git')
_pkgname='pyjavascriptcore'
pkgver=v1.0.r1.g9e714df
pkgrel=1
pkgdesc="Javascript Core for Python (When using WebKit2Gtk)"
url="https://github.com/freundTech/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python' 'cython' 'webkitgtk')
makedepends=('pkg-config')
provides=('python-javascriptcore')
conflicts=('python-javascriptcore')
source=("git://github.com/freundTech/pyjavascriptcore.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup_legacy.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup_legacy.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

