# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=lazyjournal
pkgver=0.6.0
pkgrel=1
pkgdesc='TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support'
arch=('x86_64')
url='https://github.com/Lifailon/lazyjournal'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('1a1ba20dd816cec30a31fef717c6fe3d6826cb2292f45781e6cbe840a332642b')

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
