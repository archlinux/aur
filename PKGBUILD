# Maintainer: nb
pkgname=mcp-publisher
pkgver=1.4.1
pkgrel=1
pkgdesc='CLI tool for publishing MCP server metadata to the Model Context Protocol registry'
arch=('x86_64' 'aarch64')
url='https://github.com/modelcontextprotocol/registry'
license=('Apache-2.0')
makedepends=('go')

source=("${url}/releases/download/v${pkgver}/registry-${pkgver}.tar.gz")
sha256sums=('b792f6f3b2ce4f58749be9fcf96300fe162c1cceef648b8006eca24e9afe232e')

build() {
    export CGO_ENABLED=0
    go build -trimpath \
        -ldflags="-X main.Version=${pkgver} -X main.BuildTime=$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        -o mcp-publisher ./cmd/publisher
}

package() {
    install -Dm755 mcp-publisher -t "${pkgdir}/usr/bin/"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
