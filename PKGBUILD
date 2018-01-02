# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-nightlight-git
pkgver=r40.2668b67
pkgrel=1
pkgdesc='Winganel Nightlight Indicator'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-nightlight'
license=('GPL2')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'libwingpanel-2.0.so')
makedepends=('git' 'intltool' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-nightlight')
conflicts=('wingpanel-indicator-nightlight')
source=('git+https://github.com/elementary/wingpanel-indicator-nightlight.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-nightlight

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  arch-meson ../wingpanel-indicator-nightlight
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
