# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=telegram-qt
pkgname=telegram-qt-git
pkgver=r879.63aa028
pkgrel=1
pkgdesc="Qt bindings for the Telegram protocol"
arch=(i686 x86_64)
url="https://github.com/Kaffeine/telegram-qt"
license=(GPL)
depends=(qt5-declarative)
makedepends=(cmake git)
provides=(telegram-qt)
conflicts=(telegram-qt)
source=("git+https://github.com/Kaffeine/$_gitname")
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
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
