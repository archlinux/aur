# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power
pkgver=2.0.1
pkgrel=1
pkgdesc='Power indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/wingpanel-indicator-power/loki/${pkgver}/+download/wingpanel-indicator-power-${pkgver}.tar.xz")
sha256sums=('0c401bdaa7921afbfdbdc336f4eb4909940f3550ab30918f585713afdcb96ed1')

prepare() {
  cd wingpanel-indicator-power-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-power-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-power-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
