# Maintainer: czyt <czytcn@gmail.com>
pkgname=open-idea-server-bin
pkgver=0.1.25
pkgrel=1
pkgdesc="OpenIDEA server - headless ACP agent backend for the OpenIDEA IDE"
arch=('x86_64' 'aarch64')
url="https://github.com/l0ng-ai/openidea"
license=('Apache-2.0')
depends=('glibc')
provides=('openidea-server')
conflicts=('openidea-server')
options=('!strip' '!debug')
# Upstream ships the server as a gzip-compressed single ELF binary, not a tarball.
source_x86_64=("openidea-server-linux-x86_64.gz::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/openidea-server-linux-x86_64.gz")
source_aarch64=("openidea-server-linux-aarch64.gz::https://github.com/l0ng-ai/openidea/releases/download/v${pkgver}/openidea-server-linux-aarch64.gz")
sha256sums_x86_64=('7b129d13ceeb492fc6224df7049be56f703ad7ce5d214c9b557bf20af3ad16fb')
sha256sums_aarch64=('31d2721365d0935e05a309de9446d2d86e3c9cac848d4e7b4fa7920e8956ad6b')

package() {
    local _gz_x86_64="openidea-server-linux-x86_64.gz"
    local _gz_aarch64="openidea-server-linux-aarch64.gz"

    local _gz_var="_gz_${CARCH}"
    local _gz="${!_gz_var}"
    [[ -n "${_gz}" ]] || { echo "unsupported arch: ${CARCH}" >&2; return 1; }

    # The payload is a gzip-compressed executable, not a tar archive.
    install -dm755 "${pkgdir}/usr/bin"
    gzip -dc "${srcdir}/${_gz}" > "${pkgdir}/usr/bin/openidea-server"
    chmod 755 "${pkgdir}/usr/bin/openidea-server"
}
