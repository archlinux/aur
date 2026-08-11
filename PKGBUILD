# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-mcp-bin
_upstream=fff.nvim
pkgver=0.10.3
_tag=v${pkgver}
pkgrel=1
pkgdesc="High-performance file finder MCP server for AI code assistants"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/fff.nvim"
license=('MIT')
depends=('glibc')
provides=('fff-mcp')
conflicts=('fff-mcp')
options=('!debug')
source=("LICENSE-${pkgver}::https://raw.githubusercontent.com/dmtrKovalenko/${_upstream}/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/dmtrKovalenko/${_upstream}/releases/download/${_tag}/fff-mcp-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/dmtrKovalenko/${_upstream}/releases/download/${_tag}/fff-mcp-aarch64-unknown-linux-gnu")
sha256sums=('f8264de82db188834a5711d7e348dc08c33db14f79bb587ccb42616fd694ee81')
sha256sums_x86_64=('2692bc567f8c5609a179795f5ee95555d783a678acdad9c9883e6730654a057e')
sha256sums_aarch64=('ed2db5b7268c76619178594c31e400b0973668acfa42fe6b9a06a28ad459b667')

latestver() {
    gh api --paginate "repos/dmtrKovalenko/${_upstream}/releases" --jq '.[] | select(.prerelease == false and .draft == false and any(.assets[]; .name == "fff-mcp-x86_64-unknown-linux-gnu")) | .tag_name | ltrimstr("v")' |
        head -1
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/fff-mcp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/fff-mcp" ;;
    esac
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
