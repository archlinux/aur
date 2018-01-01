# Maintainer: Giovanni 'ItachiSan' Santini <giovannisantini93@yahoo.it>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=telegram-qt
pkgname=telegram-qt-git
pkgver=r1117.0343562
pkgrel=1
pkgdesc="Qt bindings for the Telegram protocol"
arch=(i686 x86_64)
url="https://github.com/Kaffeine/telegram-qt"
license=(GPL)
depends=(qt5-declarative openssl-1.0)
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
  export PKG_CONFIG_PATH="/usr/lib/openssl-1.0/pkgconfig"
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
