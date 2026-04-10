# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver="2.0.7"
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kazumi-2.0.7.deb::https://github.com/Predidit/Kazumi/releases/download/2.0.7/Kazumi_linux_2.0.7_amd64.deb")
sha512sums=('ac8eed90d80e23bfebd3ba6f9025f58e83d60a4e84f47fe28588f5731ce240ad71487ad5c17fdd511f49e6d06a5bd4bc66d58aa677f2eb3bd30daa6ee6cb25a3')

package() {
    local _debdir="${srcdir}/deb-extract"
    local _datadir="${srcdir}/deb-data"
    local _data_archive

    rm -rf "${_debdir}" "${_datadir}"
    mkdir -p "${_debdir}" "${_datadir}"

    cd "${_debdir}"
    ar x "${srcdir}/${_pkgname}-${pkgver}.deb"

    _data_archive=$(printf '%s\n' data.tar.*)
    bsdtar -xf "${_data_archive}" -C "${_datadir}"

    cp -a "${_datadir}/." "${pkgdir}/"
}
