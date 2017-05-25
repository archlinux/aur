# Maintainer: Daniel Biehl <dbiehl@live.de>
# https://github.com/danielbiehl

pkgname=kodi-addon-pvr-dvbviewer
pkgbase=${pkgname}
_gitname=pvr.dvbviewer
pkgver=2.4.11
_gitver=tag=${pkgver}-Krypton
pkgrel=3
pkgdesc='DVBViewer PVR client addon for Kodi'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'p8-platform' 'kodi-dev' 'kodi-platform')
depends=('kodi>=17.0' )
source=("git+https://github.com/kodi-pvr/${_gitname}.git#${_gitver}")
md5sums=('SKIP')

_prefix='/usr'

build() {
  msg "Starting make..."

  cd "$srcdir/$_gitname"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib/kodi \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_MODULE_PATH=/usr/lib/kodi \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname/build"
  make DESTDIR="$pkgdir" install
}
