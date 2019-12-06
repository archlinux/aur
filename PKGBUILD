# Maintainer: Daniel Albers <daniel@lbe.rs>
# https://github.com/AlD/archlinux/tree/master/pkgbuilds/kodi-addon-pvr-hts

pkgname=kodi-addon-pvr-hts
pkgbase=${pkgname}
_gitname=pvr.hts
pkgver=4.4.20

_gitver=branch=Leia
pkgrel=1
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev')
depends=('kodi' 'p8-platform')
source=("git+https://github.com/kodi-pvr/${_gitname}.git#${_gitver}")
md5sums=('SKIP')

_prefix='/usr'

build() {
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
}
