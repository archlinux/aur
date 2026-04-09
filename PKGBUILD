# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=clawx-bin
_pkgname=${pkgname%-bin}
pkgver="0.3.7"
pkgrel=1
pkgdesc="Desktop interface for OpenClaw AI agents"
arch=('x86_64')
url='https://github.com/ValueCell-ai/ClawX'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("ClawX-0.3.7-linux-amd64.deb::https://github.com/ValueCell-ai/ClawX/releases/download/v0.3.7/ClawX-0.3.7-linux-amd64.deb")
sha512sums=('9a849219dbe8aa71e1e32c244bfa57ebacab26f0f0b50c4640e6e419d22ee4b18a0a69196663c980ad71d24e0ce0c5e24c5741dd6e8180b27639c7920150ef57')

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
