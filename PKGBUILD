# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.5
pkgrel=1
pkgdesc="EchoMusic desktop client"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("EchoMusic-${pkgver}-linux-amd64.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v${pkgver}/EchoMusic-${pkgver}-linux-amd64.deb")
sha512sums=('52a0d0fd8b173c1701e3150e9ce5d87a2ccf68aeba581705930aff224e95deb0cd5fb6e39ee2686f68e9f43d25c549c7ee09da2fb1177088789c74681b2e6b52')

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
