# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-display
pkgver=0.1.3
pkgrel=1
pkgdesc='Switchboard Display Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-display'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gnome-desktop' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-display-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-display/archive/${pkgver}.tar.gz")
sha256sums=('70e2568d2665952741fb08f79ebb18adac0c7ce7b42abb847cddb1657563d97e')

prepare() {
  cd switchboard-plug-display-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-display-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-display-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
