# Maintainer: Maxime Gauduin <alucryd@arch
# Contributor: Jameson Pugh <imntreal@gmail.com>

pkgname=openzwave
pkgver=1.6
pkgrel=3
pkgdesc='A C++ library to control Z-Wave Networks via a USB Z-Wave Controller'
arch=(x86_64)
url=http://www.openzwave.net
license=(LGPL3)
depends=(
  hidapi
  tinyxml
)
makedepends=(
  doxygen
  git
)
source=(
  git+https://github.com/OpenZWave/open-zwave.git#tag=v${pkgver}
  openzwave-system-libs.patch
)
sha256sums=('SKIP'
            '7480115fb887a37ba84ac553c66fea39b731b9789d8d176a139a663b33dd21e5')

prepare() {
  cd open-zwave

  patch -Np1 -i ../openzwave-system-libs.patch
}

build() {
  export CFLAGS="$CFLAGS -Wno-stringop-truncation -Wno-maybe-uninitialized"
  export CXXFLAGS="$CXXFLAGS -Wno-stringop-truncation -Wno-maybe-uninitialized"

  make -C open-zwave
}

package() {
  make DESTDIR="${pkgdir}" PREFIX=/usr instlibdir=usr/lib/ sysconfdir=etc/openzwave -C open-zwave install
}

# vim: ts=2 sw=2 et:
