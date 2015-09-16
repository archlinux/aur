# Maintainer: Lev Lybin <lev.lybin@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

pkgname=cloudstation
pkgver=3484
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
sha256sums_x86_64=('3f730458342cdd300afdb7b7c3794e442786df08b22934c437eb8fcfc6e31d58')
source_i686=(http://global.download.synology.com/download/Tools/CloudStation/3.2-${pkgver}/Ubuntu/Installer/i686/synology-cloud-station-${pkgver}.i686.deb)
sha256sums_i686=('05540118f5a0128d244174d2e0019c4f6974aae862160d9a1eb4029d738223c9')

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
