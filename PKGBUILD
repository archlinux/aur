# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
pkgname=xrayr
pkgver=0.9.2
pkgrel=1
pkgdesc="An Xray backend framework that can easily support many panels"
arch=('x86_64')
url="https://github.com/XrayR-project/XrayR"
license=('MPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/XrayR-project/XrayR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d448362eb505a98248484cdba90a716bbaa6a4268147c61aac2c825306f88251')

build() {
    cd "XrayR-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "${pkgname}"
}

package() {
    cd "XrayR-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
