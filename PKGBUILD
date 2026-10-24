# Maintainer: @aardbol
pkgname=vestige-bin
_pkgname=vestige
pkgver=5.0.1
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
sha256sums_x86_64=('4f31623ee32a57155289b4f53dd9b2a0d015cf1f836c6c2cec6e99330b4be707')

package() {
    local bin
    while IFS= read -r bin; do
        install -Dm755 "$bin" "$pkgdir/usr/bin/${bin##*/}"
    done < <(find "$srcdir" -maxdepth 1 -type f -executable)
}
