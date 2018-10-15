# Maintainer: Daniel Mensinger <daniel@mensinger-ka.de>
pkgname=modbus-sma
pkgver=1.0.0
pkgrel=3
pkgdesc="C++ library for accessing the the modbus interface of SMA inverters"
arch=('x86_64')
url="https://github.com/mensinda/modbusSMA"
license=('Apache')
depends=('libmodbus' 'sqlite')
makedepends=('meson' 'ninja')
source=("https://github.com/mensinda/modbusSMA/releases/download/v${pkgver}/modbusSMA-src-v${pkgver}.tar.gz")
sha256sums=('1a1170f7c9db766289f304cab8e65c5421a720fd9ed7fab6ea4f7785625d90fc')

prepare() {
  cd "modbusSMA"

  if [ -d build ]; then
    rm -rf build;
  fi
}

build() {
  cd "modbusSMA"

  arch-meson build
  ninja -C build
}

package() {
  cd "modbusSMA"

  DESTDIR="$pkgdir" ninja -C build install
}


