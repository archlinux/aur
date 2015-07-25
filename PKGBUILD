# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=kodi-addon-pvr-hts-git
pkgver=r302.5c22440
pkgrel=1
_branch=Isengard
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.hts"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform')
depends=('kodi')
provides=('kodi-addon-pvr-hts')
conflicts=('kodi-addon-pvr-hts')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.hts.git#branch=${_branch}")
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
