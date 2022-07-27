# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
pkgname=kuro
pkgver=8.1.4
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'nss' 'libxss')
provides=('ao' 'kuro')
conflicts=('ao' 'ao-git' 'kuro-appimage')
source=("${url}/releases/download/v${pkgver}/kuro-${pkgver}.pacman")
sha256sums=('1f7f7f7305d49d576e4214a02cd5899905b7c0e6b2e34e45666625bee4d38e72')

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Kuro" "${pkgdir}/opt/"
    # Link the binary
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/Kuro/kuro ${pkgdir}/usr/bin/kuro
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${pkgname}.png" \
                      "${pkgdir}${icons_dir}/${pkgname}.png"
    done

}
