# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-mouse-touchpad
pkgver=0.1.2
pkgrel=1
pkgdesc='Mouse & Touchpad plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-mouse-touchpad'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libgranite.so' 'libswitchboard-2.0.so')
makedepends=('cmake' 'vala')
source=("https://launchpad.net/switchboard-plug-mouse-touchpad/loki/${pkgver}/+download/switchboard-plug-mouse-touchpad-${pkgver}.tar.xz")
sha256sums=('a9477848a5f18d97bcea9723cb861a88c65d99f5b8154a863efd3c9fa9be2c24')

prepare() {
  cd switchboard-plug-mouse-touchpad-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-mouse-touchpad-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-mouse-touchpad-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
