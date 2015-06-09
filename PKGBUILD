# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-notifications-bzr
pkgver=r106
pkgrel=1
pkgdesc='Notifications plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('switchboard-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-notifications')
conflicts=('switchboard-plug-notifications')
source=('bzr+lp:switchboard-plug-notifications')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-notifications

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-notifications

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

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
