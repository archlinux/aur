# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-addon-pvr-vdr-vnsi
pkgver=2.6.33
# Note: Use commits from "Krypton" branch for Kodi 17
_gitver=de2c0c1450acfba34f167ff29aefd0d22d209116
pkgrel=1
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="PVR add-on for XBMC to add VDR as a TV/PVR Backend"
depends=('kodi')
makedepends=('cmake' 'git' 'kodi-dev' 'kodi-platform')
source=("git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#commit=$_gitver")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
  grep '  version' addon.xml.in | cut -d'"' -f2
}

build() {
  mkdir -p "${srcdir}/pvr.vdr.vnsi/build"
  cd "${srcdir}/pvr.vdr.vnsi/build"

  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
        -DCMAKE_BUILD_TYPE=Release \
        ..

  make
}

package() {
  cd "${srcdir}/pvr.vdr.vnsi/build"
  make DESTDIR="${pkgdir}" install

  cp -r "$srcdir"/pvr.vdr.vnsi/pvr.vdr.vnsi/* "$pkgdir/usr/lib/kodi/addons/pvr.vdr.vnsi"
}
