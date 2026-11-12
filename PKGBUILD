# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=6.2.2
pkgrel=1
pkgdesc='Long-term memory MCP server for AI agents with deterministic root-cause retrieval'
arch=('x86_64')
url='https://github.com/samvallad33/vestige'
license=('AGPL-3.0')
depends=('glibc' 'gcc-libs')
provides=('vestige')
conflicts=('vestige' 'vestige-git')
options=('!strip' '!debug')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-mcp-x86_64-unknown-linux-gnu.tar.gz")
sha256sums_x86_64=('a6bc7df5b4fecfa2be7a21c1d9822768332861ea070c2df2d376bfe5118f1721')

package() {
    local bin
    while IFS= read -r bin; do
        install -Dm755 "$bin" "$pkgdir/usr/bin/${bin##*/}"
    done < <(find "$srcdir" -maxdepth 1 -type f -executable)
}
