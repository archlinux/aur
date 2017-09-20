# Maintainer: xpt <user.xpt@gmail.com>
pkgname=nasc-git
pkgver=0.4.5.r0.g5a22841
pkgrel=1
pkgdesc='Do maths like a normal person.'
arch=('i686' 'x86_64')
url='http://parnold-x.github.io/nasc/'
license=('GPL3')
depends=('gtk3' 'libqalculate' 'granite' 'glib2' 'libgee' 'gtksourceview3' 'libsoup')
optdepends=()
makedepends=('vala' 'git' 'cmake')
provides=("nasc")
conflicts=("nasc", "nasc-bzr")
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
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd ${pkgname%-*}/build
  make DESTDIR="${pkgdir}" install
}

