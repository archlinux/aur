# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network
pkgver=0.1.1
pkgrel=3
pkgdesc='Switchboard Network Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'polkit'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('bzr' 'cmake' 'switchboard' 'vala')
source=("switchboard-plug-network-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-networking/archive/${pkgver}.tar.gz")
sha256sums=('3859f1a7fb607ac94cb11a377f0747d0596d8510f5b3ee248a1d81125c3197bc')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-networking-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
