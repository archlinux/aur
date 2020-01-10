# Maintainer: Drommer <drommer@archlinux.org>

pkgname=breath-gtk-git
pkgver=r3.da27066
pkgrel=1
pkgdesc='Breath widget theme for GTK 2 and 3'
arch=(x86_64)
url=https://gitlab.manjaro.org/artwork/themes/breath-gtk
license=('LGPL')
makedepends=(extra-cmake-modules)
source=('git+https://gitlab.manjaro.org/artwork/themes/breath-gtk')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/breath-gtk"
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  cmake ../breath-gtk \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DKDE_INSTALL_USE_QT_SYS_PATHS=ON
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
