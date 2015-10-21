# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation-beta
pkgver=4055
pkgrel=1
pkgdesc="Cloud Station Drive allows you to sync files among your Synology NAS and computers"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/dsm/6.0beta/"
license=('unknown')
depends=('libsm' 'qt5-base' 'glib2')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation')
install=cloudstation.install

source_x86_64=(http://global.download.synology.com/download/Tools/CloudStation/4.0-${pkgver}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${pkgver}.x86_64.deb)
sha256sums_x86_64=('010c67db99887b152a392504406aa00d78607cc29851121cb2baf398c2786137')
source_i686=(http://global.download.synology.com/download/Tools/CloudStation/4.0-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-drive-${pkgver}.i686.deb)
sha256sums_i686=('825886e0498c84007263c493ff16d1e9c18f8c7e5fa9e475e9c1ab556f38d675')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-cloud-station-drive "${pkgdir}/usr/bin/synology-cloud-station-drive"
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "${pkgdir}/usr/share/applications/synology-cloud-station-drive.desktop"
}
