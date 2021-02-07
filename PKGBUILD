# Maintainer : HeartsDo <heartsdo[at]vivaldi[dot]net>
# Contributor : Colin Berry <colinb969 at gmail dot com>
pkgname=flashpoint-bin
pkgver=8.2.2
pkgrel=2
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition."
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3'
         'libxss'
         'wine')
optdepends=('flashplayer-standalone: native Flash support')
source=('https://bluepload.unstable.life/flashpoint-infinity-8-2-2-amd64-deb.7z')
md5sums=('8561bb13ec24ed8af02e07bad5563a42')
backup=('usr/lib/flashpoint-infinity/config.json'
        'usr/lib/flashpoint-infinity/preferences.json')

prepare(){
    # Extract .deb
    cd ${srcdir}
    bsdtar xf flashpoint-infinity_8.2-2_amd64.deb
}

package(){
    # Extract package data
    tar xf data.tar.xz -C ${pkgdir}
    
    # Make config and preferences writable by all
    chmod 666 "${pkgdir}/usr/lib/flashpoint-infinity/config.json"
    touch "${pkgdir}/usr/lib/flashpoint-infinity/preferences.json"
    chmod 666 "${pkgdir}/usr/lib/flashpoint-infinity/preferences.json"

    # Symlink exec
    install -dm755 "${pkgdir}/usr/bin"
    ln -s "/usr/lib/flashpoint-infinity/flashpoint-launcher" "${pkgdir}/usr/bin/flashpoint-infinity"
}
