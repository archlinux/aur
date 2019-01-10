# Maintainer: xpt <user.xpt@gmail.com>
pkgname=nasc-git
_pkgname=nasc
pkgver=0.5.1.r0.g4ee07c4
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='http://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('gtk3' 'libqalculate' 'granite' 'glib2' 'libgee' 'gtksourceview3' 'libsoup' 'libpthread-stubs')
optdepends=()
makedepends=('vala' 'git' 'cmake')
provides=("nasc")
conflicts=("nasc" "nasc-bzr")
install="${pkgname%-*}.install"
source=('git+https://github.com/parnold-x/nasc')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'

}

build() {
  cd ${pkgname%-*}

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build && cd build
  cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install
  mv "${pkgdir}/usr/bin/com.github.parnold-x.nasc" "${pkgdir}/usr/bin/nasc"
}

