# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-mcp-bin
_upstream=fff.nvim
pkgver=0.1.0.20260318.6220917
_tag=${pkgver##*.}
pkgrel=1
pkgdesc="High-performance file finder MCP server for AI code assistants"
arch=('x86_64' 'aarch64')
url="https://github.com/dmtrKovalenko/fff.nvim"
license=('MIT')
depends=('glibc')
provides=('fff-mcp')
conflicts=('fff-mcp')
options=('!debug')
source=("LICENSE-${_tag}::https://raw.githubusercontent.com/dmtrKovalenko/${_upstream}/${_tag}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::https://github.com/dmtrKovalenko/${_upstream}/releases/download/${_tag}/fff-mcp-x86_64-unknown-linux-gnu")
source_aarch64=("${pkgname}-${pkgver}-aarch64::https://github.com/dmtrKovalenko/${_upstream}/releases/download/${_tag}/fff-mcp-aarch64-unknown-linux-gnu")
sha256sums=('f8264de82db188834a5711d7e348dc08c33db14f79bb587ccb42616fd694ee81')
sha256sums_x86_64=('858ea83e2ba30e269df4a17a02b23387ccbc0c55925202940ba9dd7e500eb322')
sha256sums_aarch64=('f88a0b94efafbb634de43cf1e7312b21650271694f650b6c1eb420049873e852')

latestver() {
    local _release
    _release=$(curl -fsSL "https://api.github.com/repos/dmtrKovalenko/${_upstream}/releases?per_page=1")
    local _tag_name _date
    _tag_name=$(printf '%s' "$_release" | jq -r '.[0].tag_name')
    _date=$(printf '%s' "$_release" | jq -r '.[0].published_at' | cut -dT -f1 | tr -d -)
    printf '0.1.0.%s.%s' "$_date" "$_tag_name"
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/fff-mcp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/fff-mcp" ;;
    esac
    install -Dm644 "${srcdir}/LICENSE-${_tag}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
