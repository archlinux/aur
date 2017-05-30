# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=2.0.3
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('clutter' 'cogl' 'glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('cmake' 'gala-git' 'vala')
provides=('libwingpanel-2.0.so')
source=("wingpanel-${pkgver}.tar.gz::https://github.com/elementary/wingpanel/archive/${pkgver}.tar.gz")
sha256sums=('bb290e8d3c94041977f411e0bb8080e896db2f2f96a4c317f967dd700c575b94')

prepare() {
  cd wingpanel-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd wingpanel-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
