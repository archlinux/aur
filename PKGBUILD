# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=4.2.0
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
sha256sums_x86_64=('13abe56d42dbd2d6a0b00def53f931a494677521fafae636094064d5091280d2')

package() {
    local bin
    while IFS= read -r bin; do
        install -Dm755 "$bin" "$pkgdir/usr/bin/${bin##*/}"
    done < <(find "$srcdir" -maxdepth 1 -type f -executable)
}
