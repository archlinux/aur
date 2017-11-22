# Maintainer: Lev Lybin <aur@devtrue.net>

pkgname=synology-drive-beta
pkgver=10165
_sver=1.0.0
pkgrel=1
pkgdesc="An application which sync files between your computers and Synology NAS"
arch=('i686' 'x86_64')
url="https://www.synology.com/en-global/beta/2017_Drive_1_0"
license=('unknown')
conflicts=('synology-cloud-station-drive')
depends=('qt5-base')
optdepends=('nautilus: For nautilus integration')
install=synology-drive.install

source_x86_64=(https://global.download.synology.com/download/Tools/SynologyDriveClient/${_sver}-${pkgver}/Ubuntu/Installer/x86_64/synology-drive-${pkgver}.x86_64.deb)
md5sums_x86_64=('c2a09157ee6c76ea2dde17ef3f9fbaea')
source_i686=(https://global.download.synology.com/download/Tools/SynologyDriveClient/${_sver}-${pkgver}/Ubuntu/Installer/x86_64/synology-drive-${pkgver}.i686.deb)
md5sums_i686=('4eaaae48bebe059973ae1c719db64947')


prepare() {
    cd "${srcdir}"
    tar -zxf "${srcdir}/data.tar.gz"
}

package() {
    cp -rp opt "${pkgdir}/opt"

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "${pkgdir}/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so"
    install -Dm755 usr/bin/synology-drive "${pkgdir}/usr/bin/synology-drive"
    install -Dm644 usr/share/applications/synology-drive.desktop "${pkgdir}/usr/share/applications/synology-drive.desktop"
}
