# Maintainer: J.D. Broberg <jdbroberg72 at gmail dot com>

pkgname=odin-git
_pkgname=odin
pkgver=r973.0134c38
pkgrel=2
pkgdesc="compiler for the odin programming language"
arch=('x86_64')
url="http://github.com/odin-lang/odin"
license=('BSD')
source=('git+https://github.com/odin-lang/odin.git')
makedepends=('clang' 'llvm' 'git')
conflicts=('odin')
provides=('odin')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${_pkgname}"
    make debug 
}

package() {
    cd "${_pkgname}"

    install -d "${pkgdir}/opt/${_pkgname}"
    install -Dm755 "./odin" "${pkgdir}/opt/${_pkgname}/odin"

    install -d "${pkgdir}/usr/bin"
    ln -sf "/opt/${_pkgname}/odin" "${pkgdir}/usr/bin/odin"

    cp -av "./core" "${pkgdir}/opt/${_pkgname}"

    install -Dm644 "./LICENSE" "${pkgdir}/opt/${_pkgname}/LICENSE"
}
