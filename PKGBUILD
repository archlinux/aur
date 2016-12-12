# Maintainer: Adria Arrufat <adria.arrufat+AUR@protonmail.ch>
pkgname=vast-git
pkgver=20161211+166+g623a01c
pkgrel=1
pkgdesc="Vala and scientific numerical computation"
arch=("i686" "x86_64")
url="https://github.com/rainwoodman/vast"
license=("LGPL3")
depends=(glib2 vala)
makedepends=(git meson python-sphinx vala valadoc)
source=("git://github.com/rainwoodman/vast.git")
md5sums=("SKIP")

pkgver() {
  cd vast
  _date=$(git show --format="%cd" --date=format:"%Y%m%d" --no-patch)
  _count=$(git rev-list --count HEAD)
  _commit=$(git rev-parse --short HEAD)
  echo $_date+$_count+g$_commit
}

build() {
  cd vast
  [ -d build ] && rm -rf build
  mkdir build && cd build
  meson --prefix=/usr ..
  ninja
}

check() {
  cd vast/build
  ninja test
}

package() {
  cd vast/build
  DESTDIR=${pkgdir} ninja install
}

# vim:set ts=2 sw=2 et:
