# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=6.2.0
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
sha256sums_x86_64=('527e814b91fdc3b7e5373e59538cbb18e1b459008f7a97bd234685067753cd17')

package() {
    local bin
    while IFS= read -r bin; do
        install -Dm755 "$bin" "$pkgdir/usr/bin/${bin##*/}"
    done < <(find "$srcdir" -maxdepth 1 -type f -executable)
}
