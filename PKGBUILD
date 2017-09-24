# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network
pkgver=2.1.1
pkgrel=1
pkgdesc='Wingpanel Network Indicator'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala' 'wingpanel')
source=("wingpanel-indicator-network-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-network/archive/${pkgver}.tar.gz")
sha256sums=('9f9044cfc330b1119ebd6cfd65d414715fbf69cb01df0be812908d726295ded3')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-indicator-network-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
