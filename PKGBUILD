# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers
pkgver=0.1.1
pkgrel=1
pkgdesc='Printers plug for Switchboard'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("switchboard-plug-printers-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-printers/archive/${pkgver}.tar.gz")
sha256sums=('b6dc3fac39e7dfa67baf507d932a1b6b0ead227bc36d09a08575ce0cb748209d')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-printers-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
