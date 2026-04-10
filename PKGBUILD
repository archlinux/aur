# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.8"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("ClawX-0.3.8-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.8/ClawX-0.3.8-linux-amd64.deb")
sha512sums=('9494e0158c835e1dda5dbd15b72c07253554c39918cc7ecfb894ab1b8f82f872d49f0158dcd1658dc0bd1c41c23126e70e3b9e77b5c25b0d42b2bafe12634430')

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
