# Maintainer: Tommy Falkowski <tommy@byteowlz.com>
pkgname=cmfy
pkgver=0.1.0
pkgrel=1
pkgdesc="A flexible ComfyUI CLI"
arch=('x86_64' 'aarch64')
url="https://github.com/byteowlz/cmfy"
license=('MIT')
provides=('cmfy')
conflicts=('cmfy-bin')
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/byteowlz/cmfy/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    go build -ldflags="-s -w -X cmfy/internal/cmd.version=v${pkgver}" -o cmfy ./cmd/cmfy
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 cmfy "${pkgdir}/usr/bin/cmfy"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
