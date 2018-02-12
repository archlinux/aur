# Maintainer: Bilal ELmoussaoui <bil.elmoussaoui@gmail.com>

pkgname=pb-for-desktop
pkgrel=1
pkgver=6.8.1
pkgdesc="The missing Desktop application for Pushbullet"
url="https://github.com/sidneys/pb-for-desktop"
provides=('pb-for-desktop')
arch=('i686' 'x86_64')
license=('MIT')
depends=('libnotify' 'notify-osd' 'gconf' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libxtst' 'nss')
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}.pacman")
source_i686=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-i686.pacman")
sha256sums_x86_64=('f9728dc7b66aa3bff3e7ce2520cad821dfa967245d5c5326a15cbd7b0e53f47a')
sha256sums_i686=('cb73ae2f79103f7c8cb2e9a17a44b3bf986301a35b4abec033ae20548b01db82')

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/PB for Desktop" "${pkgdir}/opt/"
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 16 24 32 48 64 96 128 256 512; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done

}
