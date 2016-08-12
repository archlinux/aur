# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network
pkgver=0.1
pkgrel=1
pkgdesc='Network plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-networking/loki/${pkgver}/+download/switchboard-plug-networking-${pkgver}.tar.xz")
sha256sums=('6220f4be9fc347f3d06e18b5e7864a302374d70b5f649b9d8728a8ebc1b22d68')

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
