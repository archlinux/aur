# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-devel
pkgver=0.10.0
pkgrel=1
pkgdesc='A lightweight email client for the GNOME desktop'
arch=('i686' 'x86_64')
url='https://wiki.gnome.org/Apps/Geary'
license=('GPL3')
depends=('gnome-keyring' 'gmime' 'libcanberra' 'libgee' 'libnotify'
         'webkitgtk')
makedepends=('cmake' 'gnome-doc-utils' 'gobject-introspection' 'intltool'
             'vala')
provides=('geary')
conflicts=('geary')
install='geary.install'
source=("https://download.gnome.org/sources/geary/${pkgver%.?}/geary-${pkgver}.tar.xz")
sha256sums=('46197a5a1b8b040adcee99082dbfd9fff9ca804e3bf0055a2e90b13214bdbca5')

build() {
  cd geary-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build

  cmake .. \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDESKTOP_UPDATE='FALSE' \
    -DICON_UPDATE='FALSE' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DGSETTINGS_COMPILE_IN_PLACE='FALSE'
  make
}

package() {
  cd geary-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
