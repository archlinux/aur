# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime
pkgver=0.1.1.1
pkgrel=1
pkgdesc='Date & Time plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("https://launchpad.net/switchboard-plug-datetime/loki/${pkgver}/+download/switchboard-plug-datetime-${pkgver}.tar.xz")
sha256sums=('f17ca0bc26ef8228ae50e165c2fcb26daa0f7091997e387e5130afa4ba66cf20')

prepare() {
  cd switchboard-plug-datetime-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-datetime-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-datetime-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
