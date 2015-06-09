# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Ner0 <darkelfdarkelf666@yahoo.co.uk>

pkgname=audience-bzr
pkgver=r518
pkgrel=1
pkgdesc='The Pantheon Video Player'
arch=('i686' 'x86_64')
url='https://launchpad.net/audience'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter-gtk' 'desktop-file-utils' 'granite-bzr'
         'gst-plugins-base-libs')
makedepends=('bzr' 'clutter-gst' 'cmake' 'vala')
provides=('audience')
conflicts=('audience')
install='audience.install'
source=('bzr+lp:audience')
sha256sums=('SKIP')

pkgver() {
  cd audience

  echo "r$(bzr revno)"
}

build() {
  cd audience

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
  cd audience/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
