# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=scrpr
pkgver=1.1.0
pkgrel=1
pkgdesc="A fast CLI for extracting main content from websites"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/scrpr"
license=('MIT')
provides=('scrpr')
conflicts=('scrpr-bin')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/byteowlz/scrpr/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w" -o scrpr ./cmd/scrpr
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 scrpr "${pkgdir}/usr/bin/scrpr"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
