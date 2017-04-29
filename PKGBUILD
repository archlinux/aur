# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-bluetooth
pkgver=0.1
pkgrel=1
pkgdesc='Network plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'wingpanel-indicator-bluetooth'
         'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'switchbooard' 'vala')
source=("https://launchpad.net/switchboard-plug-bluetooth/loki/${pkgver}/+download/switchboard-plug-bluetooth-${pkgver}.tar.xz")
sha256sums=('d8e63253ca62cd8d739ed5c3178ee51da68baa766358a80bbcc5bc0c8c201698')

prepare() {
  cd switchboard-plug-bluetooth-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-bluetooth-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-bluetooth-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
