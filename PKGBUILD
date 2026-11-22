# Maintainer: czyt <czytcn@gmail.com>
pkgname=open-idea-server-bin
pkgver=0.1.50
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
sha256sums_x86_64=('85e2809b2742d083c6fbea73c89d4092cb01804cc1ba2c03ddeff30eddd427ca')
sha256sums_aarch64=('8c7efa8051909e53a5bcecc8e6c05e54b7e6d6687fa404af4f1a17a4bcaa4a42')

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
