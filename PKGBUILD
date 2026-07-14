# Maintainer: xgjmibzr <xgjmibzr at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

pkgname=expresslrs-configurator-bin
_pkgname=expresslrs-configurator
pkgver=1.8.1
pkgrel=1
pkgdesc="Cross platform configuration & build tool for the ExpressLRS radio link"
arch=('x86_64')
url="https://github.com/ExpressLRS/ExpressLRS-Configurator"
license=('GPL')
depends=('platformio-core-udev')
conflicts=('expresslrs-configurator')
source=(
    "https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v$pkgver/expresslrs-configurator-$pkgver.pacman"
)
sha512sums=('8525a85975fbe05616d46d332fd070d5e3f54d2dfccea246d9a0c44b86e352e5e031118f56aa7215dab9c81ad4407bc3c9f5cad6d9c737453b2b76505f6efaf8')

package() {
    # Install the application files in /opt
    install -d "${pkgdir}/opt"
    cp -R "${srcdir}/opt/ExpressLRS Configurator" "${pkgdir}/opt/"
    # Install the .desktop file
    install -D -m644 "${srcdir}/usr/share/applications/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
    # Install the icons
    for icon_size in 16 24 32 48 64 96 128 256 512; do
        icons_dir="/usr/share/icons/hicolor/${icon_size}x${icon_size}/apps"
        install -d "${pkgdir}/${icons_dir}"
        install -m644 "${srcdir}${icons_dir}/${_pkgname}.png" \
                      "${pkgdir}${icons_dir}/${_pkgname}.png"
    done

    # Make symlink in /usr/bin
    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/ExpressLRS Configurator/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
