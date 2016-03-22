# Based on a PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-useraccounts-bzr
pkgver=r224
pkgrel=1
pkgdesc='User accounts plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-useraccounts'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3'
         'granite' 'switchboard' 'libpwquality')
makedepends=('bzr' 'cmake' 'vala')
provides=('switchboard-plug-useraccounts')
conflicts=('switchboard-plug-useraccounts')
source=('bzr+lp:switchboard-plug-useraccounts')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-useraccounts

  echo "r$(bzr revno)"
}

build() {
  cd switchboard-plug-useraccounts

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
  cd switchboard-plug-useraccounts/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
