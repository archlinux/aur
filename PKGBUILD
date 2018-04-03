# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth-git
pkgver=r184.23e33e8
pkgrel=1
pkgdesc='Bluetooth indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'intltool' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-bluetooth')
conflicts=('wingpanel-indicator-bluetooth')
source=('git+https://github.com/elementary/wingpanel-indicator-bluetooth.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-bluetooth

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

  arch-meson ../wingpanel-indicator-bluetooth
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
