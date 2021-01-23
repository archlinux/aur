# Maintainer: Sabu Siyad <ssiyad at disroot dot org>

pkgname=shelby-git
_pkgname=shelby
pkgver=r139.281761c
pkgrel=1
pkgdesc="A fast, lightweight, minimal, shell prompt written in Go"
arch=('x86_64')
url="https://github.com/athul/shelby"
license=("GPL3")
makedepends=(
        "git"
        "go")
provides=("shelby")
source=(
    "git+https://github.com/athul/shelby.git"
)
sha256sums=("SKIP")
conflicts=("shelby-bin")

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"
    mkdir -pv build/
}

build() {
    cd "${srcdir}/${_pkgname}"
    go get -v
    go build -o build
}

package() {
    cd "${srcdir}/${_pkgname}"
    install -D "build/${_pkgname}" "${pkgdir}/usr/local/bin/shelby"
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
