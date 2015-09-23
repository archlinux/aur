# Maintainer: Westin Miller <equinox.aur@gmail.com>
# Contributor: Michael Lass <bevan@bi-co.net>

pkgname=kodi-addon-pvr-mythtv-git
pkgver=r434.95b43c0
pkgrel=1
_branch=Isengard
pkgdesc='MythTV PVR client addon for Kodi'
arch=('armv7h' 'i686' 'x86_64')
url="https://github.com/kodi-pvr/pvr.hts"
license=('GPL')
makedepends=('cmake' 'git' 'kodi-platform-git')
depends=('kodi>=15.0')
provides=('kodi-addon-pvr-mythtv')
conflicts=('kodi-addon-pvr-mythtv' 'kodi-pvr-addons')
source=("${pkgname}::git+https://github.com/kodi-pvr/pvr.mythtv.git#branch=${_branch}")
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
