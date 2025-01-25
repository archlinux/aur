# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=superfile
_pkgname=spf
pkgver=1.1.7.1
pkgrel=1
pkgdesc='Pretty fancy and modern terminal file manager'
arch=('x86_64')
url='https://github.com/MHNightCat/superfile'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('93f130813f15dd232a91424cb1100f0dcac69c02d838014bbc6b6093a81cd369')

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
