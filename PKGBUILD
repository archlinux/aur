# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="cert-chain-resolver"
pkgver="1.0.3"
pkgrel="1"
pkgdesc="An ssl certificate chain resolver"
arch=("x86_64")
url="https://github.com/zakjan/cert-chain-resolver"
license=("MIT")
depends=()
makedepends=("go")
source=("https://github.com/zakjan/cert-chain-resolver/archive/${pkgver}.tar.gz")
sha256sums=("77d1c06930a4c8d5f8e5c86a81377174b63f8c7851ea68f773ab438f5b9a3005")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    go build -o "${pkgname}"
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    go test ./...
    ./tests/run.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}" || return
    install -D -m 755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
