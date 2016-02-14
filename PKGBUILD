# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=snap-photobooth-bzr
pkgver=r352
pkgrel=1
pkgdesc='The Pantheon Photo Booth'
arch=('i686' 'x86_64')
url='https://launchpad.net/snap-elementary'
license=('GPL3')
groups=('pantheon-unstable')
depends=('clutter' 'clutter-gst' 'clutter-gtk' 'glib2' 'glibc' 'gstreamer'
         'gtk3'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala')
install='snap-photobooth.install'
source=('snap-photobooth::bzr+lp:snap-elementary')
sha256sums=('SKIP')

pkgver() {
  cd snap-photobooth

  echo "r$(bzr revno)"
}

prepare() {
  cd snap-photobooth

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd snap-photobooth/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd snap-photobooth/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
