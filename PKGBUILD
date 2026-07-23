# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver="2.2.3"
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kazumi-2.2.3.deb::https://github.com/Predidit/Kazumi/releases/download/2.2.3/Kazumi_linux_2.2.3_amd64.deb")
sha512sums=('84dc18ae5a82b043eab386bd0841589d509372e95d46a804da4272788f0bc14aa03518b7e65fda5afc3dfb4f45430c06b7eebf86e18675c94e9b2fcf05e2701a')

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
