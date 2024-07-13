# Maintainer: devome <evinedeng@hotmail.com>

pkgname="cidr-merger"
pkgver=1.1.3
pkgrel=2
pkgdesc="A simple command line tool to merge ip/ip cidr/ip range, supports IPv4/IPv6."
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
url="https://github.com/zhanhb/${pkgname}"
license=("MIT")
provides=("${pkgname}")
makedepends=("go")
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('48b13f950d56175712c47ea7b1c0a4a905fd2995dee76708625152c134ab1cba')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    go build -trimpath -ldflags "-s -w -X main.VERSION=${pkgver} -extldflags '${LDFLAGS}'"
}
package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
