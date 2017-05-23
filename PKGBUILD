# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth
pkgver=2.0.2
pkgrel=1
pkgdesc='Bluetooth indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon')
depends=('bluez' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala' 'wingpanel')
source=("https://launchpad.net/wingpanel-indicator-bluetooth/loki/${pkgver}/+download/wingpanel-indicator-bluetooth-${pkgver}.tar.xz")
sha256sums=('453934a0999e19cded3c4f894cc30ca160485d06a62b992cd22c16a3e126135a')

prepare() {
  cd wingpanel-indicator-bluetooth-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-bluetooth-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-bluetooth-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
