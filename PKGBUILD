# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: voldyman <voldyman666 at gmail dot com> <https://launchpad.net/~voldyman>

pkgname=markmywords-bzr
pkgver=r108
pkgrel=1
pkgdesc='A markdown editor.'
arch=('i686' 'x86_64')
url='https://launchpad.net/~voldyman/markmywords'
license=('MIT')
depends=('gtksourceview3' 'glib2' 'gtk3' 'webkit2gtk')
makedepends=('vala' 'gobject-introspection' 'cmake' 'bzr')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
install="${pkgname%-*}.install"
source=('bzr+lp:markmywords')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "r%s" "$(bzr revno)"
}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  sed -i "s|webkit2gtk-3.0|webkit2gtk-4.0|g" CMakeLists.txt
  mkdir build && cd build
  cmake -DCMAKE_BUILD_TYPE=RELEASE -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd ${pkgname%-*}/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
