# Maintainer: sfs <sfslinux@gmail.com>

pkgname=qt-akvis2
pkgver=5.9.7_30
pkgrel=1
pkgdesc="Akvis-patched Qt 5.9.7 runtime"
arch=('x86_64')
url="https://alivecolors.com"
license=('GPL3' 'LGPL3' 'FDL' 'custom')
depends=('double-conversion' 'libinput' 'libproxy' 'libwacom' 'libxkbcommon-x11' 'md4c' 'tslib' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil' 'xcb-util-wm' )
makedepends=('wget' 'tar' 'libarchive')
sha256sums=('SKIP')

pkgver() {
    echo ${_pkgver} |sed 's/-/_/'
}

prepare() {
    _pkgver="`wget -q --output-document=- https://akvis-deb.sfo2.cdn.digitaloceanspaces.com/ |tr ">" "\n" |grep "</Key" |grep -v 5.9.7-7 |grep qt-akvis2_ |awk -F_ '{print $2}' |tail -1`"
    source=("https://akvis-deb.sfo2.cdn.digitaloceanspaces.com/pool/non-free/q/qt-akvis2/qt-akvis2_${_pkgver}_amd64.deb")
    wget "$source" -O ${pkgname}-${_pkgver}-1.deb &&
        bsdtar -xf ${pkgname}-${_pkgver}-1.deb &&
	tar -xf data.tar.xz
}

package() {
    cp -dr --no-preserve=ownership usr "${pkgdir}"/
}
