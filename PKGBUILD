# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime
pkgver=0.1.0.2
pkgrel=1
pkgdesc='Date & Time plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-datetime/freya/${pkgver}/+download/switchboard-plug-datetime-${pkgver}.tar.xz")
sha256sums=('fc5f52f3cc5df066ea624dd0bd66bb56c99de22fb47783a04ae1ba3389892fb0')

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
