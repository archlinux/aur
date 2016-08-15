# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power
pkgver=0.3
pkgrel=1
pkgdesc='Power plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-power'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'gnome-settings-daemon' 'vala')
source=("https://launchpad.net/switchboard-plug-power/loki/${pkgver}/+download/switchboard-plug-power-${pkgver}.tar.xz")
sha256sums=('3f8309197b8362bfb9b2ae5e9f62f9f5c1cd5fa19a7655067653f00807842fbd')

prepare() {
  cd switchboard-plug-power-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-power-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-power-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
