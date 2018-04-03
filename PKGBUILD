# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-notifications-git
pkgver=r293.ce59ba9
pkgrel=1
pkgdesc='Notifications indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libwnck3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-notifications')
conflicts=('wingpanel-indicator-notifications')
source=('git+https://github.com/elementary/wingpanel-indicator-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-notifications

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

  arch-meson ../wingpanel-indicator-notifications
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
