# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network
pkgver=2.0
pkgrel=1
pkgdesc='Network indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libnm-glib'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'nm-connection-editor' 'vala')
source=("https://launchpad.net/wingpanel-indicator-network/loki/${pkgver}/+download/wingpanel-indicator-network-${pkgver}.tar.xz")
sha256sums=('334b560bf5bd7e32df476ea3be33b692d9f6987c93a2f2a9d2be0d2d139fcce4')

prepare() {
  cd wingpanel-indicator-network-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-network-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-network-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
