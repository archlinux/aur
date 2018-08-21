# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel
pkgver=2.1.1
pkgrel=1
pkgdesc='The Pantheon Top Panel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'gtk3' 'libgee' 'mutter'
         'libgala.so' 'libgranite.so')
makedepends=('cmake' 'git' 'gala-git' 'vala')
provides=('libwingpanel-2.0.so')
source=("git+https://github.com/elementary/wingpanel.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
