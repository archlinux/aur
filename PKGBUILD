# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-applications
pkgver=0.1.2
pkgrel=2
pkgdesc='Switchboard Applications Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-applications-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-applications/archive/${pkgver}.tar.gz")
sha256sums=('ce6f3b32cebf11f95a7c59196392a9d578aa126f02e8ff3fbff00251bf58bb7f')

prepare() {
  cd switchboard-plug-applications-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-applications-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-applications-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
