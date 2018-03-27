# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-notifications-git
pkgver=r348.5717038
pkgrel=1
pkgdesc='Switchboard Notifications Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard-git' 'vala')
provides=('switchboard-plug-notifications')
conflicts=('switchboard-plug-notifications')
source=('git+https://github.com/elementary/switchboard-plug-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-notifications

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

  arch-meson ../switchboard-plug-notifications
  ninja
}

package() {
  cd build

  DESTDIR="${pkgdir}" ninja install
}

# vim: ts=2 sw=2 et:
