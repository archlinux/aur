# Maintainer: L Santos <hello@lsantos.dev>
pkgname="gdlauncher-carbon-bin"
pkgver="2.0.24"
pkgrel=2
arch=('x86_64')
pkgdesc="GDLauncher Carbon is the new version of the simple, yet powerful Minecraft custom launcher with a strong focus on the user experience"
url="https://gdlauncher.com"
license=('ARR')
# AppImages should not be stripped, as it breaks the AppImage
options=(!strip)
makedepends=('gendesk')
conflicts=('gdlauncher' 'gdlauncher-beta' 'gdlauncher-beta-bin' 'gdlauncher-appimage' 'gdlauncher-git' 'gdlauncher-bin' 'gdlauncher-appimage')
provides=('gdlauncher-carbon')
source=("${pkgname}.AppImage::https://cdn-raw.gdl.gg/launcher/GDLauncher__${pkgver}__linux__x64.AppImage"
    "${pkgname}.png::https://raw.githubusercontent.com/gorilla-devs/GDLauncher-Carbon/e048803142f1b8edb024e29329da7dc7be042ca5/apps/desktop/build/icon.png")
sha256sums=('77966f5922c0ffb998d39e344c32cc5bdaa6105039c42e9977cdc859a90e986a'
    'e72d839270b646c138aec74fbbf45a6aa601735801a478e48ca8f4c29d8ec021')

prepare() {
    # Generate .desktop
    gendesk --pkgname "GDLauncher Carbon" --pkgdesc "${pkgdesc}" --icon ${pkgname%-bin} --exec "/usr/bin/${pkgname%-bin}" --categories "Game" -n -f
}

package() {
    install -Dm755 "${srcdir}/${pkgname}.AppImage" "${pkgdir}/usr/bin/${pkgname%-bin}"

    install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname%-bin}.png"
    install -Dm644 "${srcdir}/GDLauncher Carbon.desktop" "${pkgdir}/usr/share/applications/GDLauncher-Carbon.desktop"
}
