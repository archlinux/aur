#Maintainer: lubosz <lubosz@gmail.com>
#Contributor: socke <github@socker.lepus.uberspace.de>

pkgname=assimp-git
pkgver=5.0.1.r10393.g76e3092b2
pkgrel=1
pkgdesc="Portable Open Source library to import various well-known 3D model formats in an uniform manner"
arch=(i686 x86_64)
url="http://assimp.sourceforge.net/"
license=('BSD')
depends=('boost' 'minizip')
makedepends=('cmake' 'git')
conflicts=('assimp')
provides=('assimp='$pkgver)
options=(makeflags !emptydirs)
_gitname="assimp"
source=("git://github.com/assimp/assimp.git")
md5sums=('SKIP')


pkgver() {
  cd $_gitname
  printf "%s.r%s.g%s" \
  "$(grep -oP '^PROJECT\( Assimp VERSION \K[0-9.]*' CMakeLists.txt)" \
  "$(git rev-list --count HEAD)" \
  "$(git rev-parse --short HEAD)"
}

build() {
  cd $_gitname
  cmake . -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd $_gitname
  make DESTDIR=$pkgdir install
}
