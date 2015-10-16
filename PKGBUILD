# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation
pkgver=3487
pkgrel=1
pkgdesc="Synology Cloud Station. Cloud Station allows you to sync files among your Synology NAS and computers"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('libsm' 'qt5-base')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta')
install=cloudstation.install

source_x86_64=(http://global.download.synology.com/download/Tools/CloudStation/3.2-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-${pkgver}.x86_64.deb)
sha256sums_x86_64=('68353d90b99bece3f4ff384c02ee8ee95e930cf2d0e375a94364039a7587d0b9')
source_i686=(http://global.download.synology.com/download/Tools/CloudStation/3.2-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-${pkgver}.i686.deb)
sha256sums_i686=('2fa6310a9888e11de2063cddb3f09c0574e096ca841bb2a290d8c57072505253')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-cloud-station "${pkgdir}/usr/bin/synology-cloud-station"
    install -Dm644 usr/share/applications/synology-cloud-station.desktop "${pkgdir}/usr/share/applications/synology-cloud-station.desktop"
}
