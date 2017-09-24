# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound
pkgver=2.0.5
pkgrel=2
pkgdesc='Wingpanel Sound Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee'
         'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'gobject-introspection' 'gtk2' 'intltool' 'vala' 'wingpanel')
source=("wingpanel-indicator-sound-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-sound/archive/${pkgver}.tar.gz")
sha256sums=('680617e07ec4fc6b0c21f028b12a7cd4a2cb6fcc387f67c5ac73bb8545fd0f80')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-indicator-sound-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
