# Maintainer: Sabu Siyad <hello@ssiyad.com>
# This PKGBUILD is maintained at https://github.com/ssiyad/pkgbuilds/

pkgname=inim-git
_pkgname=inim
pkgver=0
pkgrel=1
pkgdesc="Interactive Nim Shell / REPL / Playground"
arch=('x86_64')
url="https://github.com/inim-repl/INim"
license=("MIT")
makedepends=(
    "git"
    "nim"
    "nimble"
)
provides=($_pkgname)
source=(
    "git+"$url
)
sha256sums=("SKIP")

_dirname=INim

pkgver() {
    cd "${srcdir}/${_dirname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
    mkdir -p "${pkgdir}/usr/local/bin/"

    cd "${srcdir}/${_dirname}"
    nimble install
}

build() {
    cd "${srcdir}/${_dirname}"
    nim c -d:ssl -d:release inim.nim
}

package() {
    cd "${srcdir}/${_dirname}"
    install -D $_pkgname "${pkgdir}/usr/local/bin/${_pkgname}"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
