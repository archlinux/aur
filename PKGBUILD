# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=gsignond-extension-pantheon-bzr
pkgver=r131
pkgrel=1
pkgdesc='Pantheon extension for gSSO'
arch=('i686' 'x86_64')
url='https://launchpad.net/gsignond-extension-pantheon'
license=('GPL3')
depends=('gsignond' 'libsecret')
makedepends=('bzr' 'cmake' 'libaccounts-glib' 'vala')
provides=('gsignond-extension-pantheon')
conflicts=('gsignond-extension-pantheon')
source=('bzr+lp:gsignond-extension-pantheon')
sha256sums=('SKIP')

pkgver() {
  cd gsignond-extension-pantheon

  echo "r$(bzr revno)"
}

build() {
  cd gsignond-extension-pantheon

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
  cd gsignond-extension-pantheon/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
