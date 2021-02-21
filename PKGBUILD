# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-notifications-git
pkgver=2.1.7.r25.g6bb9054
pkgrel=1
pkgdesc='Switchboard Notifications Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('git' 'granite-git' 'meson' 'switchboard' 'vala')
provides=('switchboard-plug-notifications')
conflicts=('switchboard-plug-notifications')
source=('git+https://github.com/elementary/switchboard-plug-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-notifications

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  arch-meson switchboard-plug-notifications build
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}

# vim: ts=2 sw=2 et:
