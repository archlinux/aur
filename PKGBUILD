# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix

pkgname=showmypictures-git
pkgver=0.3.0.r7.gab53fbd
pkgrel=1
pkgdesc="Memories is an photo manager for Pantheon, developed by Artem Anufrij"
arch=(x86_64)
url="http://anufrij.org/memories"
license=(GPL3)
depends=(libgranite.so gtk3 libgexiv2 sqlite libraw)
makedepends=(vala cmake cmake-modules-elementary-git git)
provides=(showmypictures)
conflicts=(showmypictures)
source=("git+https://github.com/artemanufrij/showmypictures.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname/-git/}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname/-git/}"
  install -d build
}

build() {
  cd "${pkgname/-git/}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname/-git/}/build"
  make DESTDIR="${pkgdir}" install
}
