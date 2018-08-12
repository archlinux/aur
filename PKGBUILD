# Maintainer: Mark Wagie <yochanan.marqos@gmail.com>
# Co-Maintainer: jswenson
# Packager: Chris Knepper <chris82thekid@gmail.com>
pkgname=android-messages-desktop
pkgver=0.7.0
pkgrel=2
pkgdesc="Android Messages as a cross-platform desktop app"
arch=('x86_64')
url="https://github.com/chrisknepper/android-messages-desktop"
license=('MIT')
depends=('electron' 'libnotify' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libappindicator-sharp')
provides=(android-messages-desktop)
source=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
md5sums=('d61810468879d8da2fa543448b84e251')

package() {
    install -D -m644 "${srcdir}/opt/Android Messages/resources/app.asar" "${pkgdir}/usr/lib/${pkgname}/resources/app.asar"
    install -D -m644 "${srcdir}/opt/Android Messages/resources/electron.asar" "${pkgdir}/usr/lib/${pkgname}/resources/electron.asar"
    sed -i 's|Exec="/opt/Android Messages/android-messages-desktop"|Exec=electron /usr/lib/android-messages-desktop/resources/app.asar|g' "${srcdir}/usr/share/applications/${pkgname}.desktop"
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" "${pkgdir}${icons_dir}/${pkgname}.png"
    done
}
