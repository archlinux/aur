# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname="x-minecraft-launcher-appimage"
_appname=xmcl
pkgver=0.35.16
pkgrel=1
pkgdesc="An Open Source Minecraft Launcher with Modern UX. Provide a Disk Efficient way to manage all your Mods!"
arch=('aarch64' 'armv7h' 'x86_64')
url="https://xmcl.app/"
_githuburl="https://github.com/Voxelum/x-minecraft-launcher"
license=('MIT')
conflicts=("${pkgname%-appimage}")
depends=('zlib' 'glibc')
options=(!strip)
_install_path="/opt/appimages"
source_aarch64=("${pkgname%-appimage}-${pkgver}-aarch64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.AppImage")
source_armv7h=("${pkgname%-appimage}-${pkgver}-armv7h.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-arm64.AppImage")
source_x86_64=("${pkgname%-appimage}-${pkgver}-x86_64.AppImage::${_githuburl}/releases/download/v${pkgver}/${_appname}-${pkgver}-x86_64.AppImage")
source=("LICENSE::https://raw.githubusercontent.com/AppOutlet/AppOutlet/main/LICENSE")
sha256sums=('c24c91646674659de06c8dad229b589608a69be9403433b4b5efe856db4cecb8')
sha256sums_aarch64=('6658da823a89ff7bde154314fab1d6a579f964eefcb3b4af9c5fd1f0301ea810')
sha256sums_armv7h=('6658da823a89ff7bde154314fab1d6a579f964eefcb3b4af9c5fd1f0301ea810')
sha256sums_x86_64=('2bfc83e90b9f09dd6629d37025bd7969ef0518d1b2471b9a41caa7a77913f27f')

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