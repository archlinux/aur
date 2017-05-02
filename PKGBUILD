# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot
pkgver=0.1.3.1
pkgrel=1
pkgdesc='The Pantheon Screenshot Tool'
arch=('i686' 'x86_64')
url='https://github.com/elementary/screenshot-tool'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libcanberra'
         'libgranite.so')
makedepends=('cmake' 'intltool' 'vala')
source=("pantheon-screenshot-${pkgver}.tar.gz::https://github.com/elementary/screenshot-tool/archive/${pkgver}.tar.gz")
sha256sums=('373dc74356b4c5246f8ff6d42e9603ec1796eb3bd9095bcf081a69d3279e6f5d')

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
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF' \
    -DICON_UPDATE='OFF'
  make
}

package() {
  cd screenshot-tool-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
