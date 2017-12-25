# Maintainer: ValHue <vhuelamo at gmail dot com>
#
# Contributor: ValHue <vhuelamo at gmail dot com>
#
_pkgname="LibreELEC.USB-SD.Creator"
pkgname="libreelec-creator-bin"
pkgver="1.3"
pkgrel="1"
pkgdesc="Allows you to install LibreELEC on a variety of devices."
arch=('i686' 'x86_64')
url="https://libreelec.tv/"
license=('GPL2')
depends=('bash')
provides=("${pkgname}")

source_i686=("http://releases.libreelec.tv/${_pkgname}.Linux-32bit.bin"
             "https://github.com/LibreELEC/usb-sd-creator/raw/master/le_icon_256.png")
source_x86_64=("http://releases.libreelec.tv/${_pkgname}.Linux-64bit.bin"
             "https://github.com/LibreELEC/usb-sd-creator/raw/master/le_icon_256.png")
sha256sums_i686=('928373dbcafbd63357619137109672569203e979d71290ec58b1f01d6b5df85a'
                 '47636cc32d0140a4507a9b992e26f0955f68e0f6a06e8af93a4beb37de7cbcfe')
sha256sums_x86_64=('ab867a4a0c4989877226269510138c51cb660cb10d728c795ed4343b6b0cf641'
                   '47636cc32d0140a4507a9b992e26f0955f68e0f6a06e8af93a4beb37de7cbcfe')

_LibreELEC="#!/usr/bin/sh
exec gksudo /usr/share/${pkgname}/${_pkgname}.bin
fi"

_LibreELEC_desktop="[Desktop Entry]
Encoding=UTF-8
Version=1.0
Type=Application
Terminal=false
Name=LibreELEC USB-SD Creator
Exec=/usr/share/${pkgname}/${_pkgname}
Icon=/usr/share/${pkgname}/le_icon_256.png
Categories=AudioVideo;Video;Player;TV;"

build() {
    cd "${srcdir}"
    echo -e "$_LibreELEC" | tee "${_pkgname}"
    echo -e "$_LibreELEC_desktop" | tee "${_pkgname}.desktop"
}

package() {
    cd "${srcdir}"

    # Data
    install -d ${pkgdir}/usr/share/${pkgname}
    install -d ${pkgdir}/usr/share/applications
    install -m 755 ${_pkgname} "${pkgdir}/usr/share/${pkgname}/${_pkgname}"
    install -m 644 *.bin "${pkgdir}/usr/share/${pkgname}/${_pkgname}.bin"
    install -m 644 *.png "${pkgdir}/usr/share/${pkgname}/"
    
    # Desktop file
    install -Dm 644 *.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    # Fix for permissions
    chmod +x ${pkgdir}/usr/share/${pkgname}/${_pkgname}.bin
}

# vim:set ts=4 sw=2 ft=sh et:
