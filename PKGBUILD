# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=switchboard-plug-bluetooth-git
pkgver=r78.4538c1f
pkgrel=1
pkgdesc='Switchboard Bluetooth Plug'
arch=('x86_64')
url='https://github.com/elementary/switchboard-plug-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libswitchboard-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala')
provides=('switchboard-plug-bluetooth')
conflicts=('switchboard-plug-bluetooth')
replaces=('switchboard-plug-bluetooth-bzr')
source=('git+https://github.com/elementary/switchboard-plug-bluetooth.git')
sha256sums=('SKIP')

pkgver() {
  cd switchboard-plug-bluetooth

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd switchboard-plug-bluetooth

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd switchboard-plug-bluetooth/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd switchboard-plug-bluetooth/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
