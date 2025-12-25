# Maintainer: Your Name <your.email@example.com>
pkgname=peekfetch
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive system information TUI with live updates"
arch=('x86_64' 'aarch64')
url="https://github.com/YashSaini99/peekfetch"
license=('MIT')
depends=()
makedepends=('go>=1.21')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    export CGO_ENABLED=1
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    
    go build -o ${pkgname} ./cmd/peekfetch
}

check() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    go test -v ./...
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    
    # Install binary
    install -Dm755 ${pkgname} "${pkgdir}/usr/bin/${pkgname}"
    
    # Install documentation
    install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
    
    # Install license if you create one
    # install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
