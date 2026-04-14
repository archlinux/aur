# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=echomusic-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.4"
pkgrel=1
pkgdesc="EchoMusic desktop client"
arch=('x86_64')
url='https://github.com/hoowhoami/EchoMusic'
license=('MIT')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator-gtk3: tray indicator support')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("EchoMusic-2.1.4-linux-amd64.deb::https://github.com/hoowhoami/EchoMusic/releases/download/v2.1.4/EchoMusic-2.1.4-linux-amd64.deb")
sha512sums=('72a4c0de86b5f04664711dc21771817ade250938f5b03c1f0d4b349db31c661c3f6f8854b4cd6061dfcfb0a092c50e141e5f81c23f9ca67d520846e606625e25')

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
