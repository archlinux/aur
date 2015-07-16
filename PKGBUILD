# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=granite-bzr
pkgver=r862
pkgrel=1
pkgdesc='An extension of GTK+ libraries'
arch=('i686' 'x86_64')
url='https://launchpad.net/granite'
license=('LGPL3')
groups=('pantheon-unstable')
depends=('gtk3' 'libgee')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'vala')
provides=('granite' 'libgranite.so')
conflicts=('granite')
install='granite.install'
source=('bzr+lp:granite')
sha256sums=('SKIP')

pkgver() {
  cd granite

  echo "r$(bzr revno)"
}

build() {
  cd granite

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
  cd granite/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
