# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=snap-photobooth-bzr
pkgver=r336
pkgrel=1
pkgdesc='The Pantheon Photo Booth'
arch=('i686' 'x86_64')
url='https://launchpad.net/snap-elementary'
license=('GPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gst-plugins-base-libs'
         'gstreamer' 'gtk3' 'libgee'
         'libgranite.so')
makedepends=('bzr' 'cmake' 'vala' 'zeitgeist')
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
