# This PKGBUILD is part of the VDR4Arch project [https://github.com/vdr4arch]

# Maintainer: Christopher Reimer <mail+vdr4arch[at]c-reimer[dot]de>
pkgname=kodi-platform
pkgver=17
_gitver=b3e1dda58a9d5bc2a81c80b2df13a64fd1dfebbc
pkgrel=1
url="https://github.com/xbmc/kodi-platform"
arch=('x86_64' 'i686' 'armv6h' 'armv7h')
license=('GPL2')
pkgdesc="Kodi platform support library"
depends=()
makedepends=('cmake' 'git' 'kodi' 'libplatform')
source=("git+https://github.com/xbmc/kodi-platform.git#commit=$_gitver")
md5sums=('SKIP')

#pkgver() {
#  cd "${srcdir}/pvr.vdr.vnsi/pvr.vdr.vnsi"
#  grep '  version' addon.xml.in | cut -d'"' -f2
#}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake -DCMAKE_INSTALL_PREFIX="/usr" \
        -DCMAKE_INSTALL_LIBDIR="/usr/lib" \
        -DCMAKE_INSTALL_LIBDIR_NOARCH="/usr/lib" \
        -DCMAKE_BUILD_TYPE=Release \
        ../$pkgname
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
