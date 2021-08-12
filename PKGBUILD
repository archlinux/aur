# Maintainer: Piyush Pangtey <gokuvsvegita at gmail dot com>

pkgname=gocomplete
_pkgname=complete
pkgver=1.2.3
pkgrel=1
pkgdesc='bash completion for go command written in golang'
arch=('x86_64')
url='https://github.com/posener/complete'
license=('MIT')
source=(
    "https://raw.githubusercontent.com/posener/complete/v${pkgver}/LICENSE.txt"
    'go'
)
sha256sums=(
    '42707f6d0ca72916d2a48dbc977aab20a5e23270a7651bd18227e992f9d41548'
    'cf3f177396a14b0800249a16ab18e9e0e4e3b001b51f0cc28f1974fc5bb76850'
)
makedepends=('go')
depends=(
    'bash-completion'
)

build() {
    GOPATH="${srcdir}" go install -v github.com/posener/complete/gocomplete@v$pkgver
}

package() {
    install -Dm755 "${srcdir}/bin/$pkgname" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/go" "${pkgdir}/usr/share/bash-completion/completions/go"
    install -Dm644 "${srcdir}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
