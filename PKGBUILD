# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=slingshot-launcher
pkgver=2.0.1
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus' 'gtk3' 'json-glib'
         'libgee' 'libsoup' 'plank' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'switchboard' 'vala' 'wingpanel')
source=("https://launchpad.net/slingshot/loki/${pkgver}/+download/slingshot-launcher-${pkgver}.tar.xz")
sha256sums=('1a9e6bba791fe0c4795cecfe4404971813ed6f3930af9be532493d3e1a35e435')

prepare() {
  cd slingshot-launcher-${pkgver}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd slingshot-launcher-${pkgver}/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='OFF'
  make
}

package() {
  cd slingshot-launcher-${pkgver}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
