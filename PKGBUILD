# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-network-git
pkgver=r288.9c4dd72
pkgrel=1
pkgdesc='Network indicator for Wingpanel'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-network'
license=('GPL3')
groups=('pantheon-unstable')
depends=('glib2' 'glibc' 'gtk3' 'libgee' 'libnm-glib' 'nm-connection-editor'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'vala' 'wingpanel-git')
provides=('wingpanel-indicator-network')
conflicts=('wingpanel-indicator-network')
replaces=('wingpanel-indicator-nztwork-bzr')
source=('git+https://github.com/elementary/wingpanel-indicator-network.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-network

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd wingpanel-indicator-network

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-network/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE'
  make
}

package() {
  cd wingpanel-indicator-network/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
