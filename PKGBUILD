# Maintainer: GrayJack <gr41.j4ck@gmail.com>

_pkgname=janet
_pkgver=1.0.0
pkgname=janet-lang-git
pkgver=1.0.0.r1147.f2313b9
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
    make PREFIX="/usr" CC=clang -j7
}

package() {
    cd "${srcdir}/${_pkgname}"
    make PREFIX="${pkgdir}/usr" install
    make PREFIX="${pkgdir}/usr" docs
    mkdir -p ${pkgdir}/usr/share/janet
    cp -a examples ${pkgdir}/usr/share/janet
    cp -a build/doc.html ${pkgdir}/usr/share/janet
}
