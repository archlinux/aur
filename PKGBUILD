# Maintainer: Emeric Grange <emeric.grange@gmail.com>

pkgname=toolblex
pkgver=0.15
pkgrel=1
pkgdesc="A Bluetooth Low Energy device scanner and analyzer"
url="https://github.com/emericg/toolBLEx"
arch=("x86_64" "i686")
license=("GPL3")
depends=("qt6-base" "qt6-declarative" "qt6-svg" "qt6-connectivity" "qt6-charts")
makedepends=("qt6-tools" "cmake")
optdepends=("bluez-utils: extra bluetooth infos")

source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/emericg/toolBLEx/archive/v${pkgver}.tar.gz")
sha256sums=('bf496b2ed9f3aa1e3c5613fabb291bc7e7ac2cf17b49abefe47543e2197355ef')

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
