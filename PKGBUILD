# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network
pkgver=0.1.0.3
pkgrel=3
pkgdesc='Network plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'switchboard' 'vala')
source=("https://launchpad.net/switchboard-plug-networking/loki/${pkgver}/+download/switchboard-plug-networking-${pkgver}.tar.xz")
sha256sums=('9436cc3ae1aa014b48bc0aba01096b929f21ec8bd7a1374ea9cd4c1144c3af15')

prepare() {
  cd switchboard-plug-networking-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-networking-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-networking-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
