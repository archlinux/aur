# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
_iver=4421
_rver=4.2.8
pkgver=$_rver.$_iver
pkgrel=1
pkgdesc='An application which sync files between your computers and Synology NAS'
arch=('i686' 'x86_64')
url='https://www.synology.com/en-global/releaseNote/CloudStationDrive'
license=('custom')
optdepends=('nautilus: Nautilus integration')
source_x86_64=("https://global.download.synology.com/download/Tools/CloudStationDrive/$_rver-$_iver/Ubuntu/Installer/x86_64/synology-cloud-station-drive-$_iver.x86_64.deb")
source_i686=("https://global.download.synology.com/download/Tools/CloudStationDrive/$_rver-$_iver/Ubuntu/Installer/i686/synology-cloud-station-drive-$_iver.i686.deb")
sha512sums_i686=('daea19fa7f63e38350ff9c50910599eaec749b431b1eb54bbd7d0b118d49efd0232f47cfe83a1d26b60e9f36b80968f25b8b9eb881b4e59ca2de3895a791d53a')
sha512sums_x86_64=('5b46eec7a2f965aa7d35518064acaece067a6d42940631b93d672c83f0afac0ba5057d76112d76e51c32d74a2f8c33342e527d92f3c910e9e3006d8fb1938ac7')

prepare() {
    cd "$srcdir"

    tar -zxf "$srcdir"/data.tar.gz
}

package() {
    cp -rp opt "$pkgdir"/opt

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "$pkgdir"/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so
    install -Dm755 usr/bin/synology-cloud-station-drive "$pkgdir"/usr/bin/synology-cloud-station-drive
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "$pkgdir"/usr/share/applications/synology-cloud-station-drive.desktop

    install -Dm644 "$srcdir"/opt/Synology/CloudStation/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

