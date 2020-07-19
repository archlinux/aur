# Maintainer: ssfdust <ssfdust@gmail.com>
pkgname=freechat-git
_name=Freechat
url="https://github.com/eNkru/freechat"
pkgrel=1
pkgver=1.0.0.17c82a4
pkgdesc="致力于打造macOS和Linux桌面下最好用的微信（wechat）客户端。"
arch=("any")
license=("MIT")
makedepends=("git" "yarn" "gendesk")
provides=("freechat")
source=("git+https://github.com/eNkru/freechat.git")
md5sums=("SKIP")
options=(!strip)

pkgver() {
    cd "${srcdir}"/freechat/
    printf "%s.%s" "$(awk 'match($0, /"version": "(.*)"/, a) {print a[1]}' package.json)" "$(git rev-parse --short HEAD)"
}

prepare() {
    gendesk --pkgname "$_name" --pkgdesc "$pkgdesc" --icon "Freechat" --categories "Network;" --genericname "微信" --name "微信" --exec "/usr/local/bin/freechat"
}

build() {
    cd "${srcdir}"/freechat
    yarn install
    yarn run dist:linux
}

package(){
    install -Dm644 "${srcdir}"/freechat/build/icons/12x12.png "${pkgdir}"/usr/share/icons/hicolor/12x12/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/16x16.png "${pkgdir}"/usr/share/icons/hicolor/16x16/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/32x32.png "${pkgdir}"/usr/share/icons/hicolor/32x32/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/48x48.png "${pkgdir}"/usr/share/icons/hicolor/48x48/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/64x64.png "${pkgdir}"/usr/share/icons/hicolor/64x64/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/128x128.png "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/256x256.png "${pkgdir}"/usr/share/icons/hicolor/256x256/apps/Freechat.png
    install -Dm644 "${srcdir}"/freechat/build/icons/512x512.png "${pkgdir}"/usr/share/icons/hicolor/512x512/apps/Freechat.png
    install -Dm644 "${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
    install -Dm755 "${srcdir}"/freechat/dist/Freechat\ ${pkgver%.*}.AppImage "${pkgdir}"/usr/local/bin/freechat
}
