# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=4.1.0
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
sha256sums_x86_64=('16798591edbdee7b6577d0d1dda76209ddaad56ea76b3e230d0eecf23edcaa1f')

package() {
    local bin
    while IFS= read -r bin; do
        install -Dm755 "$bin" "$pkgdir/usr/bin/${bin##*/}"
    done < <(find "$srcdir" -maxdepth 1 -type f -executable)
}
