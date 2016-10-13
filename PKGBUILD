# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-ayatana
pkgver=2.0.2
pkgrel=1
pkgdesc='Ayatana indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-ayatana'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'libindicator-gtk3'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/wingpanel-indicator-ayatana/loki/${pkgver}/+download/wingpanel-indicator-ayatana-${pkgver}.tar.xz")
sha256sums=('8345c9ce3e9c6c00f44b21f00621a13660dbaf4019bd0aa48236982cd31b2cd8')

prepare() {
  cd wingpanel-indicator-ayatana-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-ayatana-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-ayatana-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
