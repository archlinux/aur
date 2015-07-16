# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=footnote-bzr
pkgver=r340
pkgrel=1
pkgdesc='Take note in elementary style'
arch=('i686' 'x86_64')
url='https://launchpad.net/footnote'
license=('GPL3')
groups=('pantheon-unstable')
depends=('sqlheavy'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'granite-bzr' 'vala')
provides=('footnote')
conflicts=('footnote')
install='footnote.install'
source=('bzr+lp:footnote')
sha256sums=('SKIP')

pkgver() {
  cd footnote

  echo "r$(bzr revno)"
}

build() {
  cd footnote

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd footnote/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
