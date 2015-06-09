# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=eidete-bzr
pkgver=r195
pkgrel=1
pkgdesc='Simple screencaster for the elementary project'
arch=('i686' 'x86_64')
url='https://launchpad.net/eidete'
license=('GPL3')
groups=('pantheon-unstable')
depends=('granite-bzr' 'gst-plugins-base-libs' 'libwnck3')
makedepends=('bzr' 'cmake' 'vala')
provides=('eidete')
conflicts=('eidete')
install='eidete.install'
source=('bzr+lp:eidete')
sha256sums=('SKIP')

pkgver() {
  cd eidete

  echo "r$(bzr revno)"
}

build() {
  cd eidete

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_EXE_LINKER_FLAGS='-lX11'
  make
}

package() {
  cd eidete/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
