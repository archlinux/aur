# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.5"
pkgrel=1
pkgdesc="EchoMusic desktop client"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("EchoMusic-2.1.5-linux-amd64.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v2.1.5/EchoMusic-2.1.5-linux-amd64.deb")
sha512sums=('0118fad55bd580ae6446b1480a042d8b783f1e2873ec0ca3f0fb773f37dac4da539192db062db008034f1439218f5b20baca29a20c9d71ca35d11b39f04d8ba8')

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
