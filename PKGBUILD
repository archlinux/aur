# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.8"
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kazumi-2.1.8.deb::https://github.com/Predidit/Kazumi/releases/download/2.1.8/Kazumi_linux_2.1.8_amd64.deb")
sha512sums=('afb3728a517aa9cdb1875e49f4cf7b83391e19ec3b39614967cc776a6b9eaa22c6f7b30f17a594be9aa5db8349be5acc5768aa21406d47aa43327f9459bee2ea')

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

    mkdir -p "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/io.github.Predidit.Kazumi.desktop" <<EOF
[Desktop Entry]
Name=Kazumi
Comment=番剧采集APP，支持流媒体在线观看
Exec=/opt/Kazumi/kazumi
Icon=io.github.Predidit.Kazumi
Terminal=false
Type=Application
Categories=Network;Video;
Keywords=anime;bilibili;
EOF
}
