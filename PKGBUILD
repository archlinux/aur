# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="x-minecraft-launcher-appimage"
_appname=xmcl
pkgver=0.35.11
pkgrel=1
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('x86_64')
url="https://xmcl.app/"
_githuburl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source=("${pkgname%-appimage}-${pkgver}.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-x86_64.AppImage"
    "LICENSE::https://raw.githubusercontent.com/AppOutlet/AppOutlet/main/LICENSE")
sha256sums=('d17022415370ef3eac818964a57427b7ff94383743492ef7fe53d39b8c2bcbc6'
            'c24c91646674659de06c8dad229b589608a69be9403433b4b5efe856db4cecb8')

prepare() {
    chmod a+x "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage"
    "./${pkgname%-appimage}-${pkgver}.AppImage" --appimage-extract > /dev/null
    sed "s|AppRun|${_install_path}/${pkgname%-appimage}.AppImage|g" -i "${srcdir}/squashfs-root/${_appname}.desktop"
}
 
package() {
    install -Dm755 "${srcdir}/${pkgname%-appimage}-${pkgver}.AppImage" "${pkgdir}/${_install_path}/${pkgname%-appimage}.AppImage"
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/0x0/apps/${_appname}.png" -t "${pkgdir}/usr/share/pixmaps"
    install -Dm644 "${srcdir}/squashfs-root/${_appname}.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}