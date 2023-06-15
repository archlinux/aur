# Maintainer: rootd <rootdmld at outlook dot com>
pkgbase="aniship-night-appimage"
pkgname="aniship-night-appimage"
buildpkgname="aniship-appimage"
pkgver=0.0.4.2
pkgrel=2
repover=0.0.4-2
pkgdesc="A convenient and functional unofficial client that allows for easy viewing of anime on PCs and laptops. Night(early) builds."
arch=('x86_64')
url="https://t.me/aniship"
_githuburl="https://github.com/progzone122/AniShip"
license=('custom')
options=(!strip)
conflicts=("${buildpkgname%-appimage}")
depends=('zlib' 'glibc')
_install_path="/opt/appimages"
source=("${buildpkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}night/setup-${repover}.AppImage")
sha256sums=('1fbe0e6388982d71268c4f4f04bf7c3f82ac0a6dee8310f8599d93be565525d2')
prepare() {
    chmod a+x "${buildpkgname%-appimage}-${pkgver}.AppImage"
    "./${buildpkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed 's|AppRun|/opt/appimages/aniship.AppImage|g;s|Icon=aniship-night|Icon=aniship|g' -i "${srcdir}/squashfs-root/${buildpkgname%-appimage}-night.desktop"
}
package() {
    install -Dm755 "${srcdir}/${buildpkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${buildpkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${buildpkgname%-appimage}-night.png" "${pkgdir}/usr/share/pixmaps/${buildpkgname%-appimage}.png"
    install -Dm644 "${srcdir}/squashfs-root/${buildpkgname%-appimage}-night.desktop" "${pkgdir}/usr/share/applications/${pkgname%-appimage}.desktop"
    install -Dm644 "${srcdir}/squashfs-root/LICENSE"* -t "${pkgdir}/usr/share/licenses/${buildpkgname}"
}
