# Maintainer: Antonio Rojas <arojas@archlinux.org>

pkgname=polkit-kde-agent-git
pkgver=r266.e60cb00
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/polkit-kde-agent-1'
license=(LGPL)
depends=(knotifications)
makedepends=(extra-cmake-modules git kdoctools python)
conflicts=(polkit-kde-agent polkit-kde-git)
provides=(polkit-kde-agent)
replaces=(polkit-kde-git)
source=('git://anongit.kde.org/polkit-kde-agent-1.git')
md5sums=('SKIP')

pkgver() {
  cd polkit-kde-agent-1
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../polkit-kde-agent-1 \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLIB_INSTALL_DIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
