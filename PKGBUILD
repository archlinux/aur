# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.3"
pkgrel=1
pkgdesc="EchoMusic desktop client"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("EchoMusic-2.1.3-linux-amd64.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v2.1.3/EchoMusic-2.1.3-linux-amd64.deb")
sha512sums=('cc07a89edbbaa042ecad113e94703f5f0c74219e90ffe34e9d264ac9c287fcc1cd045d5ecf4d95ff459599e02437a31e371510c74caae10e90f49446efbb10a4')

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
