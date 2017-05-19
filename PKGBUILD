# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power
pkgver=0.3.1
pkgrel=1
pkgdesc='Power plug for Switchboard'
arch=('i686' 'x86_64')
url='https://launchpad.net/switchboard-plug-power'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'gnome-settings-daemon' 'switchboard' 'vala')
source=("https://launchpad.net/switchboard-plug-power/loki/${pkgver}/+download/switchboard-plug-power-${pkgver}.tar.xz")
sha256sums=('7da93ef9bf3d95a6e6161f29eb023f0af29982c3fd6b45dbe76db1f70fd26859')

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
