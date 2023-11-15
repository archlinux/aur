# Author: Roman Gilg <subdiff@gmail.com>
# Maintainer: abelian424

pkgname=kdisplay-kwinft
pkgver=5.27.0
pkgrel=1
pkgdesc='App and daemon for display managing'
arch=(x86_64 aarch64)
url="https://gitlab.com/kwinft/kdisplay"
license=(LGPL)
depends=('disman' kcmutils5 plasma-framework5 qt5-sensors)
provides=(kscreen)
conflicts=(kscreen)
makedepends=(extra-cmake-modules git appstream)
source=("https://gitlab.com/kwinft/kdisplay/-/archive/kdisplay@5.27.0/kdisplay-kdisplay@5.27.0.tar.gz")
sha256sums=('e821aae5c3f428b0e759c7187d4e517d42b2a62aafc8f6271d7e93e770de9602')

prepare() {
  mkdir -p $pkgname
  cd $pkgname
  tar -xvf ../kdisplay-kdisplay@$pkgver.tar.gz --strip-components=1
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
