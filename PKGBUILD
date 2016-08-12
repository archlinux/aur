# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-screenshot
pkgver=0.1
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
sha256sums=('9ea6b48ca202457338aca71575f812f6eb03e8216d70bd92fbd9ac834e5911b2')

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
