# Maintainer: Matteo Giordano <mail@matteogiordano.me>
pkgname=superfile
_pkgname=spf
pkgver=1.1.6
pkgrel=1
pkgdesc='Pretty fancy and modern terminal file manager'
arch=('x86_64')
url='https://github.com/MHNightCat/superfile'
license=('MIT')
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('1dc7bf8208d507e7ee3ea883f9ba59f916979526560dd657b07f81d5daa9a20a')

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
