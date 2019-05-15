# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>

pkgname=gocomplete
_pkgname=complete
pkgver=1.2.1
pkgrel=3
pkgdesc='bash completion for go command written in golang'
arch=('x86_64')
url='https://github.com/posener/complete'
license=('MIT')
source=(
    "${_pkgname}-${pkgver}.tar.gz::https://github.com/posener/complete/archive/v${pkgver}.tar.gz"
    'go'
)
sha256sums=(
    '172c679610a8e91b188b0260f0615ea32ef05c6feb2dc313eaef522853758579'
    'cf3f177396a14b0800249a16ab18e9e0e4e3b001b51f0cc28f1974fc5bb76850'
)
makedepends=('go')
depends=(
    'bash-completion'
)

prepare() {
    mkdir -p "${srcdir}/src/github.com/posener/"
    cp -r "${srcdir}/${_pkgname}-${pkgver}" "${srcdir}/src/github.com/posener/${_pkgname}"
}

build() {
    GOPATH="${srcdir}"
    cd "${srcdir}/src/github.com/posener/${_pkgname}/${pkgname}"
    go get -d ./...
    go build ./...
}

package() {
    cd "${srcdir}/src/github.com/posener/${_pkgname}/${pkgname}"
    install -Dm755 "$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/go" "${pkgdir}/usr/share/bash-completion/completions/go"
    install -Dm644 ../LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
