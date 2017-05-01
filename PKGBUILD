# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session-git
pkgver=r
pkgrel=1
pkgdesc='Session indicator for Wingpanel'
arch=('i686' 'x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL2')
groups=('pantheon-unstable')
depends=('accountsservice' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'git' 'gobject-introspection' 'granite-git' 'vala'
             'wingpanel-git')
provides=('wingpanel-indicator-session')
conflicts=('wingpanel-indicator-session')
source=('git+https://github.com/elementary/wingpanel-indicator-session.git')
sha256sums=('SKIP')

pkgver() {
  cd wingpanel-indicator-session

  echo "r$(bzr revno)"
}

prepare() {
  cd wingpanel-indicator-session

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd wingpanel-indicator-session/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd wingpanel-indicator-session/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
