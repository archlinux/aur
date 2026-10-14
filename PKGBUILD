# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver="2.3.9"
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'libayatana-indicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("kazumi-2.3.9.deb::https://github.com/Predidit/Kazumi/releases/download/2.3.9/Kazumi_linux_2.3.9_amd64.deb")
sha512sums=('29664629084d4ef8a23ea7e03af6381e40c5a2fe1e2c1fa7330ad4dbceaab755bfa5a6dd4ad188f2570b60fa15fd79ca67634725bb86e4814c449eb673b916e4')

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
