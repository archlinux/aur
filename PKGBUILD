# Maintainer: ValHue <vhuelamo@gmail.com>
#
# Contributor: ValHue <vhuelamo@gmail.com>
#
pkgname="wp-desktop"
pkgver="5.2.0"
pkgrel="1"
pkgdesc="WordPress.com Desktop client"
url="https://desktop.wordpress.com/"
_url="https://github.com/Automattic/wp-desktop"
arch=('x86_64')
license=('GPL2')
depends=('alsa-lib' 'gcc-libs' 'gconf' 'gtk2' 'libgpg-error' 'libxss' 'libxkbfile' 'libxtst' 'nss')

_pkgsource="wordpress.com-linux-x64-${pkgver}.tar.gz"
source=("${_pkgsource}::${_url}/releases/download/v${pkgver}/${_pkgsource}")

sha256sums=('80be35e91a3a12a6a44709ea5a84a23cd1265ef74931a888ab27cf0cc12efb9d')

_wpcom_desktop="[Desktop Entry]
Name=WordPress.com
Comment=WordPress.com Desktop Client
Exec=/usr/bin/wpcom
Icon=/usr/share/pixmaps/wpcom.png
Type=Application
StartupNotify=true
Categories=Development;"

_wpcom_bin="#!/bin/sh

/usr/share/wpcom/wpcom"

build() {
    cd "${srcdir}"
    echo -e "$_wpcom_desktop" | tee wpcom.desktop
    echo -e "$_wpcom_bin" | tee wpcom
}

package() {
    cd "${srcdir}"/wordpress*/
    install -d ${pkgdir}/usr/share/wpcom
    mv * ${pkgdir}/usr/share/wpcom
    install -d ${pkgdir}/usr/share/applications
    install -d ${pkgdir}/usr/share/licenses/${pkgname}
    install -d ${pkgdir}/usr/share/pixmaps
    install -d ${pkgdir}/usr/bin

    cd "${srcdir}"
    install -m 644 *.desktop ${pkgdir}/usr/share/applications
    install -m 755 wpcom ${pkgdir}/usr/bin

    cd "${pkgdir}/usr/share/wpcom/"
    install -m 644 ./resources/app/public_desktop/app-logo.png ${pkgdir}/usr/share/pixmaps/wpcom.png
    install -m 644 LICENSE.electron.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=4 sw=4 et syn=sh ft=sh:
