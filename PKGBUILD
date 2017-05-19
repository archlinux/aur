# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-power
pkgver=2.1.1
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
sha256sums=('6557f16bad605f57b930febfec2f60e6c6bc24358712028fba20f67349974e5d')

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
