# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power-bzr
pkgver=r74
pkgrel=1
pkgdesc='Power indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-power')
conflicts=('wingpanel-indicator-power')
install='wingpanel-indicator-power.install'
source=('bzr+lp:wingpanel-indicator-power')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-power

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-power

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-power/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-power/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
