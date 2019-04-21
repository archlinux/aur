# Maintainer: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=spice-up
pkgname=$_pkgname-git
pkgver=1.8.0+4+ga262d29
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
url="https://github.com/Philip-Scott/Spice-up"
arch=('i686' 'x86_64')
license=('GPL')
depends=(granite libgee gtk3 json-glib libgudev libevdev)
makedepends=(git cmake vala)
groups=(gnome)
replaces=(spice-up)
provides=(spice-up)
conflicts=(spice-up)
source=("git+https://github.com/Philip-Scott/Spice-up.git")
sha256sums=('SKIP')

pkgver() {
  cd Spice-up
  git describe --tags | sed 's/-/+/g'
}

build() {
  cd Spice-up
  [ -d build ] && rm -rf build
  mkdir build && cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build .
}

package() {
  cd Spice-up/build
  make DESTDIR=${pkgdir} install
}
