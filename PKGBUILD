# Maintainer: xgjmibzr <xgjmibzr at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

pkgname=expresslrs-configurator-bin
_pkgname=expresslrs-configurator
pkgver=1.7.9
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
sha512sums=('48317651035b050f5c98c35f0ec7ced2131e4518d310505ef45e60da8ffd15107189cdbab86561135c0b89c09c2415e7c407929112a005ba492916735687fc91')

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
