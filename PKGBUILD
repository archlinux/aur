# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-notifications
pkgver=0.1.1
pkgrel=1
pkgdesc='Notifications plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-applications'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-notifications/loki/${pkgver}/+download/switchboard-plug-notifications-${pkgver}.tar.xz")
sha256sums=('752387e37611111540cf812d0737b0e675b0eb183639f8d530d3f1939e28e0dd')

prepare() {
  cd switchboard-plug-notifications-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-notifications-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-notifications-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
