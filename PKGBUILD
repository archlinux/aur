# Maintainer: PaloMiku <palomiku@outlook.com>

pkgname=kazumi-bin
_pkgname=${pkgname%-bin}
pkgver=1.7.9
pkgrel=1
pkgdesc="基于自定义规则的番剧采集APP，支持流媒体在线观看，支持弹幕"
arch=('x86_64')
url='https://github.com/Predidit/Kazumi'
license=('GPL-3.0-or-later')
depends=('libayatana-appindicator' 'xdg-user-dirs' 'webkit2gtk-4.1')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${pkgver}.tar.gz::https://github.com/Predidit/Kazumi/releases/download/${pkgver}/Kazumi_linux_${pkgver}_amd64.tar.gz"
	"https://raw.githubusercontent.com/Predidit/Kazumi/refs/tags/${pkgver}/assets/linux/io.github.Predidit.Kazumi.desktop")
sha256sums=('SKIP'
            'SKIP')

package() {
    install -d "${pkgdir}/opt/Kazumi" "${pkgdir}/usr/bin"
    cp -a "${_pkgname}" data lib "${pkgdir}/opt/Kazumi/"
    ln -s "/opt/Kazumi/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

    local _app_id="io.github.Predidit.Kazumi"
    install -Dm644 "${_app_id}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    install -Dm644 data/flutter_assets/assets/images/logo/logo_linux.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${_app_id}.png"
}
