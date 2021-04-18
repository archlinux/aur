# -*- firestarter: "makepkg --printsrcinfo > .SRCINFO" -*-
# Maintainer: Filipe Laíns (FFY00) <lains@archlinux.org>
# Contributor: Lev Lybin <aur@devtrue.net>

pkgname=synology-cloud-station-drive
_iver=4469
_rver=4.3.3
pkgver=$_rver.$_iver
pkgrel=2
pkgdesc='An application which sync files between your computers and Synology NAS'
arch=('i686' 'x86_64')
url='https://www.synology.com/en-global/releaseNote/CloudStationDrive'
license=('custom')
optdepends=('nautilus: Nautilus integration'
            'xorg-xwayland: Support running under Wayland')
source=("force-x11.patch")
md5sums=('a276cb536c6cbe1f39c88c8ee469f9c7')
source_i686=("https://global.download.synology.com/download/Tools/CloudStationDrive/$_rver-$_iver/Ubuntu/Installer/i686/synology-cloud-station-drive-$_iver.i686.deb")
md5sums_i686=('650cffb6a925d79e350e0ae52d94b718')
source_x86_64=("https://global.download.synology.com/download/Tools/CloudStationDrive/$_rver-$_iver/Ubuntu/Installer/x86_64/synology-cloud-station-drive-$_iver.x86_64.deb")
md5sums_x86_64=('2abfd45014589f1818c87050f70ea90e')

prepare() {
    cd "$srcdir"
    tar -xJf "$srcdir"/data.tar.xz
    patch -p1 < force-x11.patch
}

package() {
    cp -rp opt "$pkgdir"/opt

    install -Dm755 usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so "$pkgdir"/usr/lib/nautilus/extensions-3.0/libnautilus-cloud-extension.so
    install -Dm755 usr/bin/synology-cloud-station-drive "$pkgdir"/usr/bin/synology-cloud-station-drive
    install -Dm644 usr/share/applications/synology-cloud-station-drive.desktop "$pkgdir"/usr/share/applications/synology-cloud-station-drive.desktop

    install -Dm644 "$srcdir"/opt/Synology/CloudStation/LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
