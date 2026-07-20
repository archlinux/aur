# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=pitlane-mcp-bin
pkgver=0.11.0
pkgrel=1
pkgdesc='Token-efficient code intelligence MCP server using tree-sitter AST parsing and BM25 search'
arch=('x86_64' 'aarch64')
url='https://github.com/eresende/pitlane-mcp'
license=('MIT' 'Apache-2.0')
provides=('pitlane-mcp')
conflicts=('pitlane-mcp')
depends=('gcc-libs' 'glibc')
options=('!debug')

_base_url="${url}/releases/download/v${pkgver}/pitlane-mcp-linux"

source=("LICENSE-MIT-${pkgver}::${url}/raw/v${pkgver}/LICENSE-MIT")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_base_url}-x86_64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_base_url}-aarch64.tar.gz")
sha256sums=('2687b21e02f35c787bf71a814a4da43b2f7d47578cb05b1b58bd9f3a74f75a6c')
sha256sums_x86_64=('822d158bbec8af7c84f244822cdad086f325b3ecef1003876a2de4d53ee2e8eb')
sha256sums_aarch64=('827bcce60f23284363f6ec6196da2f35c54130df7f250dfd5cb77393ef42527b')

latestver() {
    gh api --paginate repos/eresende/pitlane-mcp/releases --jq \
        '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "pitlane-mcp-linux-aarch64.tar.gz")) | .tag_name' |
        head -1 | sed 's/^v//'
}

package() {
    install -Dm755 pitlane-mcp "${pkgdir}/usr/bin/pitlane-mcp"
    install -Dm755 pitlane "${pkgdir}/usr/bin/pitlane"
    install -Dm644 "LICENSE-MIT-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-MIT"
}
