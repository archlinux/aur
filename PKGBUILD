# Maintainer: Riley Trautman <asonix@tamu.edu>

_pkgname=pantheon-mail
pkgname=$_pkgname-bzr
pkgver=r1986
pkgrel=1
pkgdesc='The Pantheon mail client'
arch=('i686' 'x86_64')
url='https://launchpad.net/pantheon-mail'
license=('LGPL2.1')
groups=('pantheon-unstable')
depends=('desktop-file-utils' 'granite' 'gtksourceview3' 'libpeas'
  'zeitgeist' 'gmime' 'webkitgtk' 'gcr')
makedepends=('bzr' 'cmake' 'gobject-introspection' 'vala' 'vte3')
optdepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
install="$_pkgname.install"
source=('pantheon-mail::bzr+lp:pantheon-mail')
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  echo "r$(bzr revno)"
}

prepare() {
  cd $_pkgname

  sed -i 's/gtkspell-3.0/gtkspell3-3.0/' CMakeLists.txt
}

build() {
  cd $_pkgname

  if [[ -d build ]]; then
    rm -rf build
  fi

  mkdir build && cd build

  cmake .. \
    -DCMAKE_BUILD_TYPE='Release' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DGSETTINGS_COMPILE='OFF'
  make
}

package() {
  cd $_pkgname/build

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:

