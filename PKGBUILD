# Maintainer: Maxime Gauduin <alucryd@archlinux.org>

pkgname=granite-git
pkgver=r1902.0fa57d2
pkgrel=1
pkgdesc='Library that extends Gtk+'
arch=('i686' 'x86_64')
url='https://github.com/elementary/granite'
license=('LGPL3')
groups=('pantheon-unstable')
depends=('cairo' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libgee' 'pango')
makedepends=('cmake' 'git' 'gobject-introspection' 'vala')
provides=('granite' 'libgranite.so')
conflicts=('granite')
source=('git+https://github.com/elementary/granite.git')
sha256sums=('SKIP')

pkgver() {
  cd granite

  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd granite

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd granite/build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DCMAKE_INSTALL_LIBDIR='/usr/lib'
  make
}

package() {
  cd granite/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
