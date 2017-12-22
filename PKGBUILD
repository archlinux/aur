# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power-git
pkgver=r287.80f6032
pkgrel=1
pkgdesc='Power indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libudev.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-power')
conflicts=('wingpanel-indicator-power')
replaces=('wingpanel-indicator-power-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-power.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-power

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
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
