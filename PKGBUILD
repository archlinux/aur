# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=wingpanel-indicator-session
pkgver=2.0.3
pkgrel=1
pkgdesc='Wingpanel Session Indicator'
arch=('x86_64')
url='https://github.com/elementary/wingpanel-indicator-session'
license=('GPL3')
groups=('pantheon')
depends=('accountsservice' 'cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3'
         'libgranite.so' 'libwingpanel-2.0.so')
makedepends=('cmake' 'gobject-introspection' 'vala' 'wingpanel')
source=("wingpanel-indicator-session-${pkgver}.tar.gz::https://github.com/elementary/wingpanel-indicator-session/archive/${pkgver}.tar.gz")
sha256sums=('a05bbb4d5a69887d0519214013add74b6a15a035e3c4dc22a51109f60aa309fa')

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd build

  cmake ../wingpanel-indicator-session-${pkgver} \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
