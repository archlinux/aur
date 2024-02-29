# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=como
pkgver=0.1.0
pkgrel=1
pkgdesc='Library collection to easily create Wayland and X11 compositors'
arch=(x86_64 aarch64)
url="https://github.com/winft/como"
license=(LGPL)
depends=(qt6-5compat qt6-tools kauth kconfigwidgets kdbusaddons kdecoration kdoctools knewstuff kscreenlocker wlroots 'wrapland')
provides=(kwin)
conflicts=(kwin)
makedepends=(extra-cmake-modules)
optdepends=('xorg-xwayland: x11 app support for wayland')
source=("https://github.com/winft/como/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('22c44272927007ad7f6bb239a01957f2dca63692')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../v$pkgver.tar.gz --strip-components=1
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
