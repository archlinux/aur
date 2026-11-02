# Maintainer: czyt <czytcn@gmail.com>
pkgname=open-idea-server-bin
pkgver=0.1.34
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
sha256sums_x86_64=('64e77907804a5110cf8b20ed598732f2c993b09830df01f78c2430759f1ac9fe')
sha256sums_aarch64=('5f134abb0437f058f52cb5114d5cb7e7cc060c82e110990d42c7448cbec8497a')

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
