# Maintainer: Alexei Colin <ac at alexeicolin dot com>

pkgname=wireshark-nordic-ble-dissector-git
pkgdesc='A Wireshark dissector for the BLE protocol as dumped by NordicRF sniffer'
url='https://github.com/vshymanskyy/BLESniffer_Python'
arch=('any')
pkgver=r45.e942937
pkgrel=1
license=('GPL')
depends=('wireshark-common')
makedepends=('git')
source=("git+https://github.com/vshymanskyy/BLESniffer_Python")
md5sums=('SKIP')

_reponame=BLESniffer_Python

wireshark_ver() {
    pacman -Qs wireshark-common | head -1 | cut -f 2 -d' ' | cut -d'-' -f 1
}

pkgver() {
	cd $srcdir/$_reponame
    ( set -o pipefail
      git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

package() {
    dir=$pkgdir/usr/lib/wireshark/plugins/$(wireshark_ver)
	mkdir -p $dir
	cp $srcdir/$_reponame/nordic_ble.lua $dir/
}
