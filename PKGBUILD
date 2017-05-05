# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=pantheon-applications-menu-git
pkgver=r1111.ff1d629
pkgrel=1
pkgdesc='The Pantheon Application Menu'
arch=('i686' 'x86_64')
url='https://github.com/elementary/applications-menu'
license=('GPL3')
groups=('pantheon-unstable')
depends=('appstream' 'gdk-pixbuf2' 'glib2' 'glibc' 'gnome-menus' 'gtk3'
         'json-glib' 'libgee' 'libsoup' 'plank' 'zeitgeist'
         'libgranite.so' 'libswitchboard-2.0.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'granite-git' 'switchboard-git' 'vala'
             'wingpanel-git')
provides=('pantheon-applications-menu')
conflicts=('pantheon-applications-menu' 'slingshot-launcher')
replaces=('slingshot-launcher-bzr')
source=('pantheon-applications-menu::git+https://github.com/elementary/applications-menu.git')
sha256sums=('SKIP')

pkgver() {
  cd pantheon-applications-menu

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd pantheon-applications-menu

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd pantheon-applications-menu/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib' \
    -DGSETTINGS_COMPILE='OFF' \
    -DUSE_UNITY='OFF'
  make
}

package() {
  cd pantheon-applications-menu/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
