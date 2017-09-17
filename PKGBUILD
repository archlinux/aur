# Maintainer: Adria Arrufat <adria DOT arrufat+aur AT protonmail DOT ch>

_pkgname=spice-up
pkgname=$_pkgname-git
pkgver=0.9.1
pkgrel=1
pkgdesc="Create simple and beautiful presentations on the Linux desktop"
url="https://github.com/Philip-Scott/Spice-up"
arch=('i686' 'x86_64')
license=('GPL')
depends=(granite libgee gtk3 json-glib libgudev libevdev)
makedepends=(git cmake vala ninja)
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
  cmake .. -G Ninja -DCMAKE_INSTALL_PREFIX=/usr
  ninja
}

package() {
  cd Spice-up
  DESTDIR=${pkgdir} ninja -C build install
}
