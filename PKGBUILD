# Maintainer: tugyan <bilaltasdelen AT windowslive DOT com>
# Contributor: peeweep <peeweep at 0x0 dot ee>
# Contributor: David Naramski <david.naramski AT gmail.com>
# Contributor: Paul Oppenheimer <redg3ar@airmail.cc>
_pkgname=kuro
pkgname=${_pkgname}-bin
pkgver=9.1.1
pkgrel=1
pkgdesc="An Electron wrapper for Microsoft To-Do"
arch=('x86_64')
url="https://github.com/davidsmorais/kuro"
license=('MIT')
depends=('libnotify' 'libxtst' 'nss' 'libxss')
provides=('kuro')
conflicts=('kuro-appimage')
source=("${url}/releases/download/v${pkgver}/kuro-${pkgver}.pacman")
sha256sums=('b6b42ec3dd9708ac320e57565d3b15887e8dda77eb29b6c457e61d17bcf8d15b')

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/Kuro" "${pkgdir}/opt/"
    # Link the binary
    install -d ${pkgdir}/usr/bin/
    ln -s /opt/Kuro/kuro ${pkgdir}/usr/bin/kuro
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    # Install the icons
    for icon_size in 16 24 32 48 64 128 256 512 1024; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${_pkgname}.png" \
                      "${pkgdir}${icons_dir}/${_pkgname}.png"
    done

}
