# Maintainer: 0xD8C4A475
pkgname=ugh
pkgver=0.1.0
pkgrel=1
pkgdesc="Pipe any error message. Get a human explanation. Offline, zero deps."
arch=('x86_64' 'aarch64')
url="https://github.com/0xD8C4A475/ugh"
license=('Unlicense')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/0xD8C4A475/ugh/archive/v${pkgver}.tar.gz")
sha256sums=('aef6f9ad836a5d2188d1962f5d37c0a71b6ab9c70019893b66f5283c7302ed7f')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-buildmode=pie -trimpath"
    go build -ldflags "-s -w -X main.version=${pkgver}" -o ugh .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 ugh "${pkgdir}/usr/bin/ugh"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
