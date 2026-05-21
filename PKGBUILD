# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver="2.1.2"
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kazumi-2.1.2.deb::https://github.com/Predidit/Kazumi/releases/download/2.1.2/Kazumi_linux_2.1.2_amd64.deb")
sha512sums=('7bab5db2347e7f23f5ea5c4fed9a1661f7565d49aec40b138e0735a03455c139d41d6598e8a0bdcafaa2eeed7b94722de6a2d5f3b46c338ff2a886d3fd17925f')

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
