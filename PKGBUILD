# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=telepathy-morse
pkgname=telepathy-morse-git
pkgver=r82.4161790
pkgrel=1
pkgdesc="Telepathy Connection Manager for the Telegram network"
arch=(i686 x86_64)
url="https://projects.kde.org/telepathy-morse/"
license=(GPL)
depends=(telepathy-qt5)
makedepends=(cmake git telegram-qt-git)
source=("git://anongit.kde.org/$_gitname.git")
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
  cmake ../telepathy-morse \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/telepathy \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

