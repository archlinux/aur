# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
_pkgver=0.5.0
pkgname=janet-lang-git
pkgver=0.5.0.r1109.7918add
pkgrel=1
pkgdesc="A dynamic Lisp dialect and bytecode vm"
arch=('armv6h' 'armv7h' 'i686' 'x86_64' 'aarch64')
url="https://janet-lang.org/"
license=('MIT')
depends=()
makedepends=('git' 'clang')
provides=('janet')
conflicts=('janet-lang')
source=("git+https://github.com/janet-lang/janet.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"

    # Get the version number.
    printf "${_pkgver}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX="${pkgdir}/usr" CC=clang -j7
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX="${pkgdir}/usr" install
}
