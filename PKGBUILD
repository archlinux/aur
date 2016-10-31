# Maintainer: Adrian Freund <freundadrian@gmail.com>

pkgname=('python2-javascriptcore3-git')
_pkgname='pyjavascriptcore'
pkgver=v1.0.r3.gecefcdb
pkgrel=1
pkgdesc="Javascriptcore-3.0 for Python (for use with webkitgtk-3.0)"
url="https://github.com/freundTech/pyjavascriptcore"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('python2' 'cython2' 'webkitgtk')
provides=('python2-javascriptcore3')
conflicts=('python2-javascriptcore3')
makedepends=('pkg-config')
source=("git://github.com/freundTech/pyjavascriptcore.git")
sha512sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"
    python2 setup_legacy.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python2 setup_legacy.py install --root="${pkgdir}" --optimize=1 --skip-build
    install -Dm644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

