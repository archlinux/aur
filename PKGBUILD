# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: marcin mikołajczak <me@mkljczk.pl>

pkgname=tokodon-git
pkgver=r202.c80bd74
pkgrel=1
pkgdesc='A native Mastodon client'
arch=('i686' 'x86_64')
url='https://invent.kde.org/network/tokodon'
license=(LGPL)
depends=(kirigami2 qtkeychain-qt5 kdbusaddons ki18n qt5-websockets knotifications)
makedepends=(extra-cmake-modules qt5-tools git qt5-svg qt5-multimedia qt5-websockets qt5-quickcontrols2 kcoreaddons ki18n knotifications knotifyconfig qqc2-desktop-style )
optdepends=()
conflicts=(tokodon)
provides=(tokodon)
source=('git+https://invent.kde.org/network/tokodon.git')
md5sums=('SKIP')

pkgver() {
  cd tokodon
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../tokodon \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_LIBDIR=lib \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make $MAKEFLAGS
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}

