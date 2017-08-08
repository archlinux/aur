# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot
pkgver=0.1.4
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
sha256sums=('b01ef495818cc026a3eaf5446aac7b7e507a7625ea855c012c8ae4ee5c38a572')

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
