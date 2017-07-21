# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs

pkgname="wp-desktop"
pkgver=2.6.0
pkgrel=1
pkgdesc="WordPress.com Desktop client"
url="https://desktop.wordpress.com/"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('alsa-lib' 'gcc-libs' 'gconf' 'gtk2' 'libgpg-error' 'libxss' 'libxtst' 'nss')
provides=("${pkgname}")

source_i686=("wp-desktop-linux-i686-$pkgver.tar.gz::https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?ref=getapps")
source_x86_64=("wp-desktop-linux-x64-$pkgver.tar.gz::https://public-api.wordpress.com/rest/v1.1/desktop/linux/download?ref=getapps")

sha256sums_i686=('62f35efaa21c1f4003c94904e34684954e5e2211f9c0bdec6e34e2aa8d333fce')
sha256sums_x86_64=('62f35efaa21c1f4003c94904e34684954e5e2211f9c0bdec6e34e2aa8d333fce')

_wpcom_desktop="[Desktop Entry]
Name=WordPress.com
Comment=WordPress.com Desktop Client
Exec=/usr/share/wpcom/wpcom
Icon=/usr/share/pixmaps/wpcom.png
Type=Application
StartupNotify=true
Categories=Development;"

build() {
    cd "${srcdir}"
    echo -e "$_wpcom_desktop" | tee wpcom.desktop
}

package() {
    cd "${srcdir}"/WordPress.com-linux-*
    install -d ${pkgdir}/usr/share/wpcom
    mv * ${pkgdir}/usr/share/wpcom
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/bin

    cd "${srcdir}"
    install -m 644 *.desktop ${pkgdir}/usr/share/applications

    cd "${pkgdir}/usr/share/wpcom"
    install -m 644 WordPress.png ${pkgdir}/usr/share/pixmaps/wpcom.png
    install -m 644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
    mv WordPress.com wpcom
    ln -s /usr/share/wpcom/wpcom ${pkgdir}/usr/bin/wpcom 
}

# vim:set ts=4 sw=2 ft=sh et:
