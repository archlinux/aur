# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot
pkgver=0.1.0.3
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('i686' 'x86_64')
url='https://launchpad.net/screenshot-tool'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgranite.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/screenshot-tool/0.1.x/${pkgver}/+download/screenshot-tool-${pkgver}.tar.xz")
sha256sums=('4a963d3916906e300c6f6b7abdacbe32a9e5a7d3ad848a316823da3146552306')

prepare() {
  cd screenshot-tool-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd screenshot-tool-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr'
  make
}

package() {
  cd screenshot-tool-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
