# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=go-music-dl-bin
_pkgname="Go Music DL"
_rpmname=music-dl-desktop-go
pkgver=1.0.19
pkgrel=1
pkgdesc="一个基于 Go 语言的全网音乐搜索与下载工具。支持 CLI 命令行与 Web 服务双模式，内置网易云、QQ、酷狗、Bilibili、汽水音乐等 10+ 个主流平台，支持多源并发搜索与无损音质解析.(Prebuilt version)"
arch=('x86_64')
url="https://music.zkkp.nyc.mn/"
_ghurl="https://github.com/guohuiyuan/go-music-dl"
license=('AGPL-3.0-only')
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
depends=(
    'gtk3'
    'webkit2gtk-4.1'
    'ffmpeg'
)
source=("${pkgname%-bin}-${pkgver}.rpm::${_ghurl}/releases/download/v${pkgver}/${_rpmname}-linux-amd64.rpm")
sha256sums=('d1ad16bd78154c536925bff8bdba772a6be70152499f37453296d5c03d16ce8e')
prepare() {
    sed -i -e "
        s/Name=${_rpmname}/Name=${_pkgname}/g
        s/Exec=${_rpmname}/Exec=${pkgname%-bin}/g
        s/Icon=${_rpmname}/Icon=${pkgname%-bin}/g
    " "${srcdir}/usr/share/applications/${_rpmname}.desktop"
}
package() {
    install -Dm755 "${srcdir}/usr/bin/${_rpmname}" "${pkgdir}/usr/bin/${pkgname%-bin}"
    install -Dm644 "${srcdir}/usr/share/applications/${_rpmname}.desktop" "${pkgdir}/usr/share/applications/${pkgname%-bin}.desktop"
    install -Dm644 "${srcdir}/usr/share/icons/hicolor/256x256/apps/${_rpmname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-bin}.png"
}

