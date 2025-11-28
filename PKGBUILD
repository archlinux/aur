# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=toolblex
pkgver=0.14.1
pkgrel=2
pkgdesc="A Bluetooth Low Energy device scanner and analyzer"
url="https://github.com/emericg/toolBLEx"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-svg" "qt6-connectivity" "qt6-charts")
makedepends=("qt6-tools" "cmake")
optdepends=("bluez-utils: extra bluetooth infos")

source=("https://github.com/emericg/toolBLEx/archive/v${pkgver}.tar.gz")
sha256sums=('49bd4a8f861cb64ad9c7874ed359e35bcbbf45e394d017f098491bb181032d34')

build() {
  cd "toolBLEx-${pkgver}"
  cmake -B build/ -DCMAKE_BUILD_TYPE=Release
  cmake --build build/ --config Release
}

package() {
  cd "toolBLEx-${pkgver}"
  DESTDIR="$pkgdir" cmake --install build --prefix /usr/
  #sudo setcap cap_net_admin,cap_net_raw=${pkgdir}/usr/bin/toolBLEx
}
