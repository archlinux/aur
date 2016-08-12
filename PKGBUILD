# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-printers
pkgver=0.1
pkgrel=1
pkgdesc='Printers plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-printers'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libcups' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-printers/loki/${pkgver}/+download/switchboard-plug-printers-${pkgver}.tar.xz")
sha256sums=('6eb10258ac7c93a3bbd175c1b941fabacd90983ffee5b5952ebdd6d0421c29a9')

prepare() {
  cd switchboard-plug-printers-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-printers-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-printers-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
