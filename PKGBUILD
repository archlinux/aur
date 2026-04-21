# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoa@t1c.dev>
_pkgname="dune-cli"
pkgname="${_pkgname}"
pkgver=0.1.14
pkgrel=1
pkgdesc="Dune Analytics CLI"
arch=('x86_64' 'aarch64')
makedepends=('go' 'glibc')
url="https://github.com/duneanalytics/cli"
license=('MIT')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3be9a02fcdd15034467196b6a213da84ca104146084051407792bdfd044d747')

build() {
    cd "${srcdir}/cli-${pkgver}" || exit
    export CGO_ENABLED=1
    go build -v -trimpath -buildmode=pie \
        -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
        -o dune ./cmd
}

package() {
    cd "${srcdir}/cli-${pkgver}" || exit
    install -Dm755 "dune" "${pkgdir}/usr/bin/dune"
}
