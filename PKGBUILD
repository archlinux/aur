# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=pantheon-files-plugin-dropbox-bzr
pkgver=r24
pkgrel=1
pkgdesc='Dropbox integration for pantheon-files'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-files'
license=('GPL3')
depends=('pantheon-files')
makedepends=('bzr' 'cmake')
provides=('pantheon-files-plugin-dropbox')
conflicts=('pantheon-files-plugin-dropbox')
source=('bzr+lp:~elementary-apps/pantheon-files/pantheon-files-plugin-dropbox')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  echo "r$(bzr revno)"
}

build() {
  cd pantheon-files-plugin-dropbox

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd pantheon-files-plugin-dropbox/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
