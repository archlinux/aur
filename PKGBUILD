# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver=0.3.6
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("ClawX-${pkgver}-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v${pkgver}/ClawX-${pkgver}-linux-amd64.deb")
sha256sums=('SKIP')

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
