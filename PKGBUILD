# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation-beta
pkgver=3423
pkgrel=1
pkgdesc="Synology Cloud Station. Cloud Station allows you to sync files among your Synology NAS and computers"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-us/support/beta_dsm_5_2"
license=('unknown')
depends=('libsm' 'qt5-base')
optdepends=('nautilus: For nautilus integration')
install=cloudstation.install

source_x86_64=(synology-cloud-station-64-${pkgver}.deb::http://global.download.synology.com/download/Tools/CloudStation/${pkgver}/Ubuntu/x64/synology-cloud-station-${pkgver}.deb)
sha256sums_x86_64=('6e558472642e73f1a8e23dc5f248a60b6af9c6630862d47aa67559e44dcf4039')
source_i686=(synology-cloud-station-32-${pkgver}.deb::http://global.download.synology.com/download/Tools/CloudStation/${pkgver}/Ubuntu/x32/synology-cloud-station-${pkgver}.deb)
sha256sums_i686=('99fc1fe70497c7abf5dd58ef3aea03bb6045821189ba7ae51675e9e74b83094f')

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
