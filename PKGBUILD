# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-mcp-bin
_upstream=fff.nvim
pkgver=0.6.1
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
sha256sums_x86_64=('9978753d9082cfd6a4d9af207f1a0d3934f86412812c159b0557b82297723494')
sha256sums_aarch64=('94167388ea948486ce6c57a9f030934456f7e60fd3c35b10c34dc157290a6216')

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
