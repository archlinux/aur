# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

pkgname=polkit-kde-agent-git
pkgver=r442.14f09c4
pkgrel=1
pkgdesc='Daemon providing a polkit authentication UI for KDE'
arch=(i686 x86_64)
url='https://projects.kde.org/projects/kde/workspace/polkit-kde-agent-1'
license=(LGPL)
depends=(knotifications-git)
makedepends=(extra-cmake-modules-git git kdoctools-git python)
conflicts=(polkit-kde-agent polkit-kde-git)
provides=(polkit-kde-agent)
replaces=(polkit-kde-git)
source=('git+https://github.com/KDE/polkit-kde-agent-1.git')
groups=('plasma')
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
    -DKDE_INSTALL_LIBDIR=lib
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
