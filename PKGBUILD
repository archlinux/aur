# Maintainer: xgjmibzr <xgjmibzr at gmail dot com>
# Contributor: Jordan Day < jordanday444 at gmail dot com >

pkgname=expresslrs-configurator-bin
_pkgname=expresslrs-configurator
pkgver=1.8.4
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
sha512sums=('a66062088306feffa912d9ed8adfb8600c8bc32cb3225d55acbb0795947e612f4889e8526f60e25288b69c1bbde6455ec04457d5f2a76c136695da64f9b1654f')

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
