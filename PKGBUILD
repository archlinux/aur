# Maintainer: bjarneo <https://github.com/bjarneo>
pkgname=coo
pkgver=0.1.1
pkgrel=1
pkgdesc='A light terminal IRC client built on Bubble Tea'
arch=('x86_64' 'aarch64')
url='https://github.com/bjarneo/coo'
license=('MIT')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/bjarneo/coo/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c3fb787d38f4dafd145f4fca511cc5638b9ddc07001b2be23e4b77115e9c0f1d')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_ENABLED=0
    export GOFLAGS="-trimpath -mod=readonly -modcacherw"
    go build -ldflags="-s -w -X main.version=v${pkgver}" -o coo .
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 coo "${pkgdir}/usr/bin/coo"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
