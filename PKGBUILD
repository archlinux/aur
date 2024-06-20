# Maintainer: Jordan Day < jordanday444 at gmail dot com >

pkgname=expresslrs-configurator-bin
_pkgname=expresslrs-configurator
pkgver=1.7.0
pkgrel=1
pkgdesc="Cross platform configuration & build tool for the ExpressLRS radio link"
arch=('x86_64')
url="https://github.com/ExpressLRS/ExpressLRS-Configurator"
license=('GPL')
depends=('platformio-core-udev')
source=(
    "https://github.com/ExpressLRS/ExpressLRS-Configurator/releases/download/v$pkgver/expresslrs-configurator-$pkgver.pacman"
)
sha512sums=('1d0b1e52506c7ddfaf5ac6dc9ffe5df0505bf2244fd24a71848dc8684a4988e86e404b680f52f550bafff4dcf5a5eb34b77179403466f9921d14d43ff9805e7f')

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
