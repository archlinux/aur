# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: flamelab <panosfilip@gmail.com>

pkgname=slingshot-launcher-bzr
pkgver=r633
pkgrel=1
pkgdesc='The Pantheon Application Launcher'
arch=('i686' 'x86_64')
url='https://launchpad.net/slingshot'
license=('GPL3')
groups=('pantheon-unstable')
depends=('gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus' 'gtk3' 'json-glib'
         'libgee' 'libsoup' 'plank' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so' 'libwingpanel-2.0.so')
makedepends=('bzr' 'cmake' 'vala')
provides=('slingshot-launcher')
conflicts=('slingshot-launcher')
install='slingshot-launcher.install'
source=('slingshot-launcher::bzr+lp:slingshot')
sha256sums=('SKIP')

pkgver() {
  cd slingshot-launcher

  echo "r$(bzr revno)"
}

prepare() {
  cd slingshot-launcher

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd slingshot-launcher/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='FALSE' \
    -DUSE_UNITY='FALSE'
  make
}

package() {
  cd slingshot-launcher/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
