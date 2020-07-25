# Maintainer: Lukas Sabota <lukas at lwsabota dot com>
# Contributor: Malte Deiseroth <mdeiseroth88 at gmail dot com>

pkgname=kodi-addon-vfs-rar
pkgbase=${pkgname}
_gitname=vfs.rar
pkgver=2.3.1
_kodiver=Leia
pkgrel=1
pkgdesc="Rar Addon for Kodi $_kodiver"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev>=18.0')
depends=('kodi' 'p8-platform')
source=("https://github.com/xbmc/vfs.rar/archive/${pkgver}-${_kodiver}.zip")
md5sums=('4f8015cc32c1449c3e25c2bcc4454fa3')

_prefix='/usr'

build() {
  msg "Starting make..."

  cd "$srcdir/$_gitname-$pkgver-$_kodiver"
  mkdir -p build && pushd build
  cmake \
    -DCMAKE_INSTALL_PREFIX=$_prefix \
    -DCMAKE_BUILD_TYPE=Release \
    ..
  make
  popd
}

package() {
  cd "$srcdir/$_gitname-$pkgver-$_kodiver/build"
  make DESTDIR="$pkgdir" install
}
