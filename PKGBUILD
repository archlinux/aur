# Maintainer: Karl Fischer <kmf@fischer.org.za>
pkgname=sword-tui
pkgver=1.9.0
pkgrel=1
pkgdesc="A terminal-based Bible application built with Go and bubbletea"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/kmf/sword-tui"
license=('GPL-2.0-or-later')
depends=()
makedepends=('go')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('c0e7fbfe658caf703eaba96a6bc044fe396aab05677144ae2fee569bac7867e0')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    go build -o ${pkgname} ./cmd/sword-tui
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
