# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=kodi-addon-pvr-vdr-vnsi-git
pkgver=r295.550a4a2
pkgrel=1
_branch=Isengard
pkgdesc='VDR VNSI PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.vdr.vnsi"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform')
depends=('kodi>=15.0')
provides=('kodi-addon-pvr-vdr-vnsi')
conflicts=('kodi-addon-pvr-vdr-vnsi')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.vdr.vnsi.git#branch=${_branch}")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  mkdir -p "$pkgname/build"
  cd "$pkgname/build"

  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
}

package() {
  cd "$pkgname/build"
  make DESTDIR="$pkgdir" install
}
