# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="aniship-appimage"
pkgver=0.0.4
pkgrel=1
pkgdesc="A convenient and functional unofficial client that allows for easy viewing of anime on PCs and laptops."
arch=('x86_64')
url="https://t.me/aniship"
_githuburl="https://github.com/progzone122/AniShip"
license=('custom')
options=(!strip)
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}-night/setup-${pkgver}.AppImage")
sha256sums=('344a3c493d52a33a1cc522e401f760fce653357ac3dc726b458739d6b1038f2b')
prepare() {
    chmod a+x "${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/aniship.AppImage|g;s|Icon=aniship-night|Icon=aniship|g' -i "${srcdir}/squashfs-root/${pkgname%-appimage}-night.desktop"
}
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${pkgname%-appimage}-night.png" "${pkgdir}/usr/share/pixmaps/${pkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${pkgname%-appimage}-night.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}