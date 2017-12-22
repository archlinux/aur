# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-network-git
pkgver=r582.16f3beb
pkgrel=1
pkgdesc='Network plug for Switchboard'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-networking'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-network')
conflicts=('switchboard-plug-network')
replaces=('switchboard-plug-network-bzr')
source=('switchboard-plug-network::git+https://github.com/elementary/switchboard-plug-networking.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-network

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-network

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-network/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-network/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
