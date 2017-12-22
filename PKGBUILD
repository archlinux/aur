# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-notifications-git
pkgver=r267.433459c
pkgrel=1
pkgdesc='Switchboard Notifications Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-notifications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-notifications')
conflicts=('switchboard-plug-notifications')
replaces=('switchboard-plug-notifications-bzr')
source=('git+https://github.com/elementary/switchboard-plug-notifications.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-notifications

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-notifications

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-notifications/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-notifications/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
