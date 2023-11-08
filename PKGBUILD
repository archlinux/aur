# Maintainer: Mahdi Sarikhani <mahdisarikhani@outlook.com>
pkgname=xrayr
pkgver=0.9.1
pkgrel=1
pkgdesc="A Xray backend framework that can easily support many panels"
arch=('x86_64')
url="https://github.com/XrayR-project/XrayR"
license=('MPL')
depends=('glibc')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/XrayR-project/XrayR/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('7dabaf3d32d18f69eff772e741fbee31058386de3f359f0851ba17531ff2d724')

build() {
    cd "XrayR-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "${pkgname}" ./main/
}

package() {
    cd "XrayR-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
