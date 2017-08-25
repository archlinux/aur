# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-bluetooth
pkgver=2.0.3
pkgrel=1
pkgdesc='Wingpanel Bluetooth Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-bluetooth'
license=('GPL3')
groups=('pantheon')
depends=('bluez' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'vala' 'wingpanel')
source=("wingpanel-indicator-bluetooth-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-bluetooth/archive/${pkgver}.tar.gz")
sha256sums=('b0d86f97715d350f9602dd029e187c4408d9370182d0e7061e8d304a5d551f1d')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-indicator-bluetooth-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
