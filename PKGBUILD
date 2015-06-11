# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation
pkgver=3479
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
sha256sums_x86_64=('9f875851c960bb4cbc5c416bd41288a1bee5110b040fce27930052638f1258f3')
source_i686=(synology-cloud-station-32-${pkgver}.deb::http://global.download.synology.com/download/Tools/CloudStation/${pkgver}/Ubuntu/x32/synology-cloud-station-${pkgver}.deb)
sha256sums_i686=('0fe0b177d74d53b0dd8940afe9e8a0ff656b8f65cca4ee50f9f3d226ada6dbc0')

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
