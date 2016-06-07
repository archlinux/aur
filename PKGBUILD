# Maintainer: Rob Lynn <rob22uk at gmail dot com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: sebikul <sebikul@gmail.com>
# Contributor: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=geary-devel
pkgver=0.11.0
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
sha256sums=('c947bb1e70bd3d3f4799e59ddd05b27b08a8132674f64c68c919974595bdcd9f')

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
