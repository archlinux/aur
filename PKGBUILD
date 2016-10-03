# Maintainer: Daniel Biehl <dbiehl@live.de>
# https://github.com/danielbiehl

pkgname=kodi-addon-pvr-dvblink
pkgbase=${pkgname}
_gitname=pvr.dvblink
pkgver=2.2.0
_gitver=branch=Jarvis
pkgrel=2
pkgdesc='DVBLink PVR client addon for Kodi'
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/kodi-pvr/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'libplatform-legacy')
depends=('kodi' 'tinyxml2')
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
