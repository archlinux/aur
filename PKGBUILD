# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-applications-bzr
pkgver=r78
pkgrel=1
pkgdesc='Applications plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon-unstable')
depends=('switchboard-bzr')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-applications')
conflicts=('switchboard-plug-applications')
replaces=('switchboard-plug-default-applications-bzr'
          'switchboard-plug-startup-applications-bzr')
source=('bzr+lp:switchboard-plug-applications')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-applications

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-applications

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
  cd switchboard-plug-applications/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
