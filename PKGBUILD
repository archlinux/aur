# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mbusd
pkgver=0.5.2
pkgrel=1
pkgdesc="Open-source Modbus TCP to Modbus RTU (RS-232/485) gateway."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/3cky/mbusd"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/3cky/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('3a004b3537802c56196d91bb23fe46b44e9a43f9dcdb7d3442f7cb775da17c07a5d7a376d6318bf8acbb7aeaa86733f757b3b4fecb15b055442ca3f7e7bb08a5')

build() {
  cd "$srcdir/${pkgname}-${pkgver}/"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ../
  make
}

package() {
  cd "$srcdir/${pkgname}-${pkgver}/build"
  make DESTDIR="$pkgdir" PREFIX=/usr install
  install -Dm644 "$srcdir/${pkgname}-${pkgver}/LICENSE" "$pkgdir"/usr/share/licenses/mbusd/LICENSE
}
