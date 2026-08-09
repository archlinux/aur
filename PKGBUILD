# Maintainer: L Santos <hello@lsantos.dev>
pkgname="gdlauncher-carbon-bin"
pkgver="2.0.40"
pkgrel=1
arch=('x86_64')
pkgdesc="GDLauncher Carbon is the new version of the simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdlauncher.com"
license=('ARR')
# AppImages should not be stripped, as it breaks the AppImage
options=(!strip)
makedepends=('gendesk' 'fuse2')
conflicts=('gdlauncher' 'gdlauncher-beta' 'gdlauncher-beta-bin' 'gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-bin' 'gdlauncher-appimage')
provides=('gdlauncher-carbon')
source=("${pkgname}-${pkgver}.AppImage::https://cdn-raw.gdl.gg/launcher/GDLauncher__${pkgver}__linux__x64.AppImage"
    "${pkgname}.png::https://raw.githubusercontent.com/gorilla-devs/GDLauncher-Carbon/e048803142f1b8edb024e29329da7dc7be042ca5/apps/desktop/build/icon.png")
sha256sums=('dd7c01f333ce5fcdf3c693e246d2e829bf8204917a6b1ef2dd67d0c845db0336' 'e72d839270b646c138aec74fbbf45a6aa601735801a478e48ca8f4c29d8ec021')

prepare() {
    # Generate .desktop
    gendesk --pkgname "GDLauncher Carbon" --pkgdesc "${pkgdesc}" --icon ${pkgname%-bin} --exec "/usr/bin/${pkgname%-bin}" --categories "Game" -n -f
}

package() {
    install -Dm755 "${srcdir}/${pkgname}-${pkgver}.AppImage" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/GDLauncher Carbon.desktop" "${pkgdir}/usr/share/applications/GDLauncher-Carbon.desktop"
}
