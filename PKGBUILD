# Maintainer: Marcin Mikołajczak <me@m4sk.in>

_pkgname=arqiver
pkgname=$_pkgname-git
pkgver=0.7.0.r0.g7beb131
pkgrel=1
pkgdesc="Simple Qt archive manager based on libarchive…"
arch=("i686" "x86_64")
url="https://github.com/tsujan/Arqiver"
license=("GPL3")
depends=("libarchive" "gzip" "p7zip" "qt5-base" "qt5-x11extras" "qt5-svg")
makedepends=("qt5-tools")
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("git+https://github.com/tsujan/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
      cd $_pkgname
      #printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
      #git describe --long --tags | sed 's/^V-//;s/\([^-]*-g\)/r\1/;s/-/./g'
      git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | cut -c2-48
}

prepare() {
  mkdir -p build
}

build() {
  cd build

  qmake ../$_pkgname
  make
}

package() {
  cd build
  make INSTALL_ROOT="$pkgdir" install
}
