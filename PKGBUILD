# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=2.0.4
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('cmake' 'gala-git' 'vala')
provides=('libwingpanel-2.0.so')
source=("wingpanel-${pkgver}.tar.gz::https://github.com/elementary/wingpanel/archive/${pkgver}.tar.gz")
sha256sums=('05d9b55d73878dd92259cb10a9e969a2edd57d4527be34b381d6ddf99d062af5')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-${pkgver} \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
