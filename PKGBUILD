# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=superfile
_pkgname=spf
pkgver=1.1.3
pkgrel=1
pkgdesc='Pretty fancy and modern terminal file manager'
arch=('x86_64')
url='https://github.com/MHNightCat/superfile'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1735a2a7886b670ff392f1331b2af142416691ac86303945feccbc4a1f2c6a43')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o "./bin/${_pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 "bin/${_pkgname}" ${pkgdir}/usr/bin/${_pkgname}
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 changelog.md "${pkgdir}/usr/share/doc/${pkgname}/changelog.md"
}
