# Maintainer: Daniel Albers <daniel@lbe.rs>
# Contributo: dhead666 <myfoolishgames@gmail.com>
# https://github.com/AlD/archlinux

pkgname=kodi-addon-pvr-hts_b0rked
pkgbase=${pkgname}.git
_gitname=pvr.hts
pkgver=2.1.13
_gitver=1d1f409f1963f88870314181a29ab81b11c5589c
pkgrel=3
pkgdesc='Tvheadend HTSP PVR client addon for Kodi'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'libplatform')
depends=('kodi')
source=("https://github.com/kodi-pvr/$_gitname/archive/$_gitver.tar.gz")
md5sums=('SKIP')

_prefix='/usr'

build() {
  msg "Starting make..."

  cd "$srcdir/$_gitname-$_gitver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$_gitver/build"
  make DESTDIR="$pkgdir" install
}
