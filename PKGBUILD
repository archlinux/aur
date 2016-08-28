# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=2.0.1
pkgrel=2
pkgdesc='The Pantheon Top Panel'
arch=('i686' 'x86_64')
url='https://launchpad.net/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('clutter' 'cogl' 'glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('cmake' 'gala-bzr' 'vala')
provides=('libwingpanel-2.0.so')
source=("https://launchpad.net/wingpanel/2.x/${pkgver}/+download/wingpanel-${pkgver}.tar.xz")
sha256sums=('e378ba458d4d1bfb8cc8c5ef3f2cf67692f2e2bfe50e1d02c73bf375c9220f7a')

prepare() {
  cd wingpanel-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-${pkgver}/build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
