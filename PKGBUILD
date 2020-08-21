# Maintainer: Richard Villarreal <richard.x.villarreal@gmail.com>

pkgname=pb-for-desktop
pkgrel=1
pkgver=11.0.2
pkgdesc="The Desktop application for Pushbullet"
url="https://github.com/sidneys/pb-for-desktop"
provides=('pb-for-desktop')
arch=('i686' 'x86_64')
license=('MIT')
depends=('libnotify' 'notify-osd' 'gconf' 'libappindicator-gtk2' 'libappindicator-gtk3' 'libxtst' 'nss')
source_x86_64=("${url}/releases/download/v${pkgver}/${pkgname}-${pkgver}-x64.pacman")
sha256sums_x86_64=('bb5b29578b0685ed3c5356df18e72b17bc88cc52f9cc8a63bc1e6d2a1f9074f5')

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

    # Add a launch script
    printf '#!/usr/bin/bash\n\nXDG_DATA_DIRS=/usr/local/share/:/usr/share/ "/opt/PB for Desktop/pb-for-desktop"' > "${srcdir}/pushbullet"
    install -d "${pkgdir}/usr/bin"
    install -D -m755 "${srcdir}/pushbullet" "${pkgdir}/usr/bin/"
}
