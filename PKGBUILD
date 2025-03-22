# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=lazyjournal
pkgver=0.7.6
pkgrel=1
pkgdesc='TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support'
arch=('x86_64')
url='https://github.com/Lifailon/lazyjournal'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9a997cdf451c2a5cba4c7ae26656219b8c28146161246e6238e27a723ab99a05')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "./bin/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "bin/${pkgname}" ${pkgdir}/usr/bin/${pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
