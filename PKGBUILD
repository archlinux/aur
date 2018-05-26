# Maintainer: Filipe Laíns <filiipe.lains@gmail.com>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
_iver=4415
_rver=4.2.7
pkgver=$_rver.$_iver
pkgrel=1
pkgdesc="An application which sync files between your computers and Synology NAS"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/releaseNote/CloudStationDrive"
license=('unknown')
optdepends=('nautilus: For nautilus integration')
install=synology-cloud-station-drive.install
source_x86_64=(https://global.download.synology.com/download/Tools/CloudStationDrive/${_rver}-${_iver}/Ubuntu/Installer/x86_64/synology-cloud-station-drive-${_iver}.x86_64.deb)
sha256sums_x86_64=('9caeff7d7a5331150531a2dda492a74672082550d57463c8d122452dcb7bc5d7')
source_i686=(https://global.download.synology.com/download/Tools/CloudStationDrive/${_rver}-${_iver}/Ubuntu/Installer/i686/synology-cloud-station-drive-${_iver}.i686.deb)
sha256sums_i686=('9a7b088d26edc3f53928818dd48a244cc75c0afd552231c67046692781e7e786')

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
