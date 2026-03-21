# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=fff-mcp-bin
_upstream=fff.nvim
pkgver=0.4.2
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
sha256sums_x86_64=('96e208d4e53f7b4c6ad6a3ce4cea01f0098e35b11f7781e44019b3286cf7d770')
sha256sums_aarch64=('453d6da8691916f06aaa5caab69ac85c85edefad3258b1d7846dbef9423185fd')

latestver() {
    curl -fsSL "https://api.github.com/repos/dmtrKovalenko/${_upstream}/releases/latest" |
        jq -r 'select(.assets[].name == "fff-mcp-x86_64-unknown-linux-gnu") | .tag_name | ltrimstr("v")'
}

package() {
    case "${CARCH}" in
        x86_64)  install -Dm755 "${srcdir}/${pkgname}-${pkgver}-x86_64" "${pkgdir}/usr/bin/fff-mcp" ;;
        aarch64) install -Dm755 "${srcdir}/${pkgname}-${pkgver}-aarch64" "${pkgdir}/usr/bin/fff-mcp" ;;
    esac
    install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
