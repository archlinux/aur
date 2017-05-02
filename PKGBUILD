# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-datetime
pkgver=0.1.2
pkgrel=1
pkgdesc='Switchboard Date & Time Plug'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-datetime'
license=('GPL3')
groups=('pantheon')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'switchboard' 'vala')
source=("switchboard-plug-datetime-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-datetime/archive/${pkgver}.tar.gz")
sha256sums=('4578df15df57e3d5538ec4ba6288a0535a664b3452dbe2f91f6122e4ae3e2a79')

prepare() {
  cd switchboard-plug-datetime-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-datetime-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-datetime-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
