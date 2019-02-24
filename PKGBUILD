# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
pkgname=janet-lang
pkgver=0.3.0
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang')
source=("https://github.com/janet-lang/janet/archive/${pkgver}.tar.gz"
        "0001-fix-man-path.patch")
sha256sums=('9e9cedcf4ab354929c6e4244a962784a51906107cd3ad762106661e1975fbe00'
            'd22c024bddc057e74347aa4a1ba0d0095cb03dc23828171b71e3acb9441a60cf')

prepare() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    patch Makefile "${srcdir}/0001-fix-man-path.patch"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" CC=clang -j7
}

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make PREFIX="${pkgdir}/usr" install
}
