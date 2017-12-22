# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth-git
pkgver=r111.0c3df8d
pkgrel=1
pkgdesc='Bluetooth indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon-unstable')
depends=('bluez' 'glib2' 'glibc' 'gtk3' 'libgee'
         'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'intltool' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-bluetooth')
conflicts=('wingpanel-indicator-bluetooth')
source=('git+https://github.com/elementary/wingpanel-indicator-bluetooth.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-bluetooth

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-bluetooth

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-bluetooth/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd wingpanel-indicator-bluetooth/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
