# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-git
pkgver=r292.1ae5d21
pkgrel=1
pkgdesc='Session indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL2')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('git' 'gobject-introspection' 'granite-git' 'meson' 'vala'
             'wingpanel-git')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('git+https://github.com/elementary/wingpanel-indicator-session.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-session

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

  arch-meson ../wingpanel-indicator-session
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
