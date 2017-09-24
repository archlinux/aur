# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-power
pkgver=0.3.2
pkgrel=2
pkgdesc='Power plug for Switchboard'
arch=('i686' 'x86_64')
url='https://github.com/elementary/switchboard-plug-power'
license=('GPL3')
groups=('pantheon')
depends=('glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'gnome-settings-daemon' 'switchboard' 'vala')
source=("switchboard-plug-power-${pkgver}.tar.gz::https://github.com/elementary/switchboard-plug-power/archive/${pkgver}.tar.gz")
sha256sums=('4d6615432dd865ebb94b74782d747a0c578e0350b886dceb4b20cba240e87fb5')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../switchboard-plug-power-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make -j1
}

package() {
  make DESTDIR="${pkgdir}" -C build install
}

# vim: ts=2 sw=2 et:
