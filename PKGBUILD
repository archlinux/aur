# Maintainer: Matteo Giordano <mail at matteogiordano dot me>
pkgname=lazyjournal
pkgver=0.8.6
pkgrel=1
pkgdesc='TUI for journalctl, file system logs, as well Docker and Podman containers for quick viewing and filtering with fuzzy find and regex support'
arch=('x86_64')
url='https://github.com/Lifailon/lazyjournal'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('5798b65c98ec00f32cf43e79b31568896084881adb3afc9e7cda3482baad3183')

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
