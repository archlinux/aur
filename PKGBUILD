# Maintainer: graysky <therealgraysky AT proton DOT me>
# Contributor: Winston Astrachan <winston dot astrachan at gmail dot com>

pkgname=wireguard-vanity-keygen
pkgver=0.1.2
pkgrel=1
pkgdesc='WireGuard vanity key generator'
arch=('x86_64')
url='https://github.com/axllent/wireguard-vanity-keygen'
license=('MIT')
depends=('glibc')
makedepends=('go>=1.11')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6f5528bbb37c7dfc0d571986abd4c380eefe94404e227d8222eb8f247f650e76')

build() {
    cd ${pkgname}-${pkgver}
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build .
}

package() {
    cd ${pkgname}-${pkgver}

    # Install license file
    install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install executable
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
