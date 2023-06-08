# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="music-you-appimage"
pkgver=2.0.12
pkgrel=1
pkgdesc="一个美观简约的Material Design 3 (Material You) 风格网易云音乐播放器pc客户端"
arch=('x86_64')
url="https://v-player-git-dev-gumengyu.vercel.app/"
_githuburl="https://github.com/GuMengYu/music-you"
license=('AGPL3')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
makedepends=('git' 'npm' 'gendesk' 'yarn')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.tar.gz::${_githuburl}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('449ae97cb8ea4a12b2cd263d6bf28979e49a4df6711761d4442cea1af6a85e87')
build() {
    cd "${srcdir}/${pkgname%-appimage}-${pkgver}"
    npm install
    npm run electron:build:linux
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}/release/${pkgver}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/${pkgname%-appimage}-${pkgver}/doc/logo.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    gendesk -f -n --icon "${pkgname%-appimage}" --categories "AudioVideo" --name "music-you" --exec "${_install_path}/${pkgname%-appimage}.AppImage --no-sandbox %U"
    install -Dm644 "${srcdir}/${pkgname}.desktop" -t "${pkgdir}/usr/share/applications"
}