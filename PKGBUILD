# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-sound
pkgver=2.0.4
pkgrel=1
pkgdesc='Wingpanel Sound Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-sound'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra' 'libgee'
         'libnotify' 'libpulse'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'intltool' 'vala' 'wingpanel')
source=("wingpanel-indicator-sound-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-sound/archive/${pkgver}.tar.gz")
sha256sums=('0419476e767c9e01fbc639f307b54ba443a4fe9d8e18bb980b9454dcc4458e93')

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
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd wingpanel-indicator-sound-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
