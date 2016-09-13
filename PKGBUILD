# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound
pkgver=2.0.1
pkgrel=1
pkgdesc='Sound indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee'
         'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'gobject-introspection' 'gtk2' 'vala')
source=("https://launchpad.net/wingpanel-indicator-sound/loki/${pkgver}/+download/wingpanel-indicator-sound-${pkgver}.tar.xz")
sha256sums=('1549714b4e7289a17421867b1fa52ea5bf304f54e30bd11f6b6bca99105675ab')

prepare() {
  cd wingpanel-indicator-sound-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-sound-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-sound-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
