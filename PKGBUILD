# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-a11y-bzr
pkgver=r3
pkgrel=1
pkgdesc='Accessibility indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel-indicator-a11y'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glibc' 'gtk3' 
         'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('wingpanel-indicator-a11y')
conflicts=('wingpanel-indicator-a11y')
source=('bzr+lp:wingpanel-indicator-a11y')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-a11y

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-a11y

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-a11y/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-a11y/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
