# Maintainer: Antonio Rojas

pkgname=telegram-qt4-git
pkgver=r260.66c8547
pkgrel=1
pkgdesc="Qt4 bindings for the Telegram protocol"
arch=('i686' 'x86_64')
url="https://github.com/Kaffeine/telegram-qt/"
license=('GPL')
depends=('qt4')
makedepends=('cmake' 'git')
provides=('telegram-qt4')
conflicts=('telegram-qt4')
source=("git+https://github.com/Kaffeine/telegram-qt/")
md5sums=('SKIP')
options=('staticlibs')

pkgver() {
  cd telegram-qt
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../telegram-qt \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release \
    -DUSE_QT4=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
