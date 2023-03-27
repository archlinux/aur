# Maintainer: Lukas Sabota <lukas at lwsabota dot com>
# Contributor: Malte Deiseroth <mdeiseroth88 at gmail dot com>

pkgname=kodi-addon-vfs-rar-git
pkgbase=${pkgname}
_gitname=vfs.rar
pkgver=4.0.0
_gitver=branch=Nexus
pkgrel=2
pkgdesc='Rar Addon for Kodi - git version'
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/xbmc/$_gitname"
license=('GPL')
groups=('kodi-addons')
makedepends=('cmake' 'kodi-platform' 'git' 'kodi-dev>=20.0')
depends=('kodi' 'p8-platform')
source=("git+https://github.com/xbmc/${_gitname}.git#${_gitver}")
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
