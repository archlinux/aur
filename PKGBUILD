# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=redream-git
pkgver=r1078.ffb73022
pkgrel=1
pkgdesc="SEGA Dreamcast emulator (not open source anymore!)"
url="http://redream.io"
arch=('x86_64')
license=('GPL3')
depends=('gcc-libs')
makedepends=('cmake')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://github.com/inolen/redream.git")
md5sums=('SKIP')

pkgver() {
  cd redream
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  rm -rf build
  mkdir -p build

  # fix building
  sed 's/-Werror//' -i redream/CMakeLists.txt
}

build() {
  cd build
  cmake ../redream -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  install -Dm0755 build/redream "$pkgdir/usr/bin/redream"
}
