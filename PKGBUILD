# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.2"
pkgrel=1
pkgdesc="EchoMusic desktop client"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("EchoMusic-2.1.2-linux-amd64.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v2.1.2/EchoMusic-2.1.2-linux-amd64.deb")
sha512sums=('ab2b95853e95862705f660a5b2c406fefcee52b49e339a95e448b619d82103e5d148086e44f0d2e5793c2e6b1aa203921b2e2f97e73b33e9edac6aec3867154a')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/EchoMusic-${pkgver}-linux-amd64.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"
}
