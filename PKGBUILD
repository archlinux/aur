# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power
pkgver=2.1.0
pkgrel=1
pkgdesc='Wingpanel Power Indicator'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-power'
license=('GPL3')
groups=('pantheon')
depends=('bamf' 'glib2' 'glibc' 'gtk3' 'libgee' 'libgtop'
         'libgranite.so' 'libudev.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'intltool' 'vala' 'wingpanel')
source=("wingpanel-indicator-power-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-power/archive/${pkgver}.tar.gz")
sha256sums=('8305cb61f3468859271775f2ef105b8729e1e05695f3bd98fc1c9fb144592b39')

prepare() {
  cd wingpanel-indicator-power-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-power-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd wingpanel-indicator-power-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
