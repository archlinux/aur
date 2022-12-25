# Maintainer: inv2004 (https://github.com/inv2004)

pkgname=ttop
pkgver=v0.4.2
pkgrel=1
pkgdesc="Interactive Nim Shell / REPL / Playground"
arch=('x86_64')
url="https://github.com/inv2004/ttop"
license=("MIT")
makedepends=(
    "git"
    "nim"
)
provides=($pkgname)
source=(
    "git+"$url
)
sha256sums=("SKIP")
install=".INSTALL"

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "%s" $(git tag | sort -V | tail -1)
}

prepare() {
    true
}

build() {
    cd "${srcdir}/${pkgname}"
    nimble -d:release build
    nim r src/ttop/onoff.nim
}

package() {
    cd "${srcdir}/${pkgname}"
    install -D $pkgname "${pkgdir}/usr/bin/${pkgname}"
    mkdir -p "${pkgdir}/usr/lib/systemd/system"
    install -m644 usr/lib/systemd/system/* "${pkgdir}/usr/lib/systemd/system"
}
