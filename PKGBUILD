# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation
pkgver=3482
pkgrel=1
pkgdesc="Synology Cloud Station. Cloud Station allows you to sync files among your Synology NAS and computers"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('libsm' 'qt5-base')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta')
install=cloudstation.install

source_x86_64=(synology-cloud-station-64-${pkgver}.deb::http://global.download.synology.com/download/Tools/CloudStation/${pkgver}/Ubuntu/x64/synology-cloud-station-${pkgver}.deb)
sha256sums_x86_64=('b1286cbeedc0d81d5f95c00464ed5bb08b160653029b2f4c2c1aec6539282b59')
source_i686=(synology-cloud-station-32-${pkgver}.deb::http://global.download.synology.com/download/Tools/CloudStation/${pkgver}/Ubuntu/x32/synology-cloud-station-${pkgver}.deb)
sha256sums_i686=('713b42aaa2b77206100b772e90a2b0703b7ca867f0946ce594387e71cb842359')

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
