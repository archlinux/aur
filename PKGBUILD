# Maintainer: zoe <chp321@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstationdrive
_pkgname=CloudStationDrive
pkgver=4.0.4204
_pkgver=4.0
pkgver_=4204
pkgrel=1
pkgdesc="Synology Cloud Station Drive : CloudStation client to sync files among your Synology NAS (DSM 6.x) and computers"
arch=('i686' 'x86_64')
url="http://www.synology.com"
license=('unknown')
depends=('libsm' 'qt5-base')
optdepends=('nautilus: For nautilus integration')
conflicts=('cloudstation-beta' 'cloudstation' 'synology-cloud-station-drive')
install=cloudstationdrive.install

source_x86_64=(http://global.download.synology.com/download/Tools/${_pkgname}/${_pkgver}-${pkgver_}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${pkgver_}.x86_64.deb)
md5sums_x86_64=('42000dfddaafe8b2ab95fa34e0d487c1')

source_i686=(http://global.download.synology.com/download/Tools/${_pkgname}/${_pkgver}-${pkgver_}/Ubuntu/Installer/i686/synology-cloud-station-drive-${pkgver_}.i686.deb)
md5sums_i686=('4889c9a0388837e0ac9b6994d3d92e71')

prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"
    mkdir -p "${pkgdir}/usr/share"
    cp -rp usr/share/doc "${pkgdir}/usr/share/doc"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-cloud-station-drive "${pkgdir}/usr/bin/synology-cloud-station-drive"
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "${pkgdir}/usr/share/applications/synology-cloud-station-drive.desktop"
}
