# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=kdisplay-kwinft
pkgver=6.0.0
pkgrel=1
pkgdesc='App and daemon for display managing'
arch=(x86_64 aarch64)
url="https://github.com/winft/kdisplay"
license=(LGPL)
depends=('disman' kcmutils5 plasma-framework5 qt6-sensors)
provides=(kscreen)
makedepends=(extra-cmake-modules git appstream)
source=("https://github.com/winft/kdisplay/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('b1da715f9eb0cffb116ea9d0f756668da96848db562b4a2de5a524f321759537')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../v$pkgver.tar.gz --strip-components=1
}

build() {
  mkdir -p build
  cd build
  cmake ../$pkgname \
    -DCMAKE_BUILD_TYPE=Release
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
