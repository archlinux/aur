# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.9"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("ClawX-0.3.9-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.9/ClawX-0.3.9-linux-amd64.deb")
sha512sums=('d9c239f33fa4d440f512ec1f31f47b45670451dc914a29b73f6e8ff1eb0a256d9266ccc9a38f4e6072a5cf7ec15e29323dcdfc1a2bf830958dcd6f58490785ce')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/ClawX-${pkgver}-linux-amd64.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"
}
