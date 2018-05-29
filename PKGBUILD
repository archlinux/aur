# Maintainer: Alexey Andreyev <aa13q@ya.ru>

_gitname=telepathy-tank
pkgname=telepathy-tank-git-wip
pkgver=r14.cd7a92b
pkgrel=1
pkgdesc="Matrix connection operator for the Telepathy framework. WIP git branch"
arch=(i686 x86_64 armv7 aarch64)
url="https://telepathy.freedesktop.org/"
license=(GPL)
depends=(telepathy-qt-git qt5-matrixclient-git)
makedepends=(cmake git)
provides=(telepathy-tank)
conflicts=(telepathy-tank)
source=("git+https://github.com/TelepathyIM/$_gitname#branch=wip")
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telepathy-tank \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release \
    -DQT_VERSION_MAJOR=5
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
