# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds or https://codeberg.org/matt/aur-pkgbuilds

pkgname=mbusd
pkgver=0.5.3
pkgrel=1
pkgdesc="Open-source Modbus TCP to Modbus RTU (RS-232/485) gateway."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/3cky/mbusd"
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/3cky/${pkgname}/archive/v${pkgver}.tar.gz")
b2sums=('9fa2f07092157f1f33264c43ce3acef06b40449c566de0e3d3835d54b3c2494839d305c378666303298c033f0aa8ee938ea57ed9791be45b9b413d02eaf6f60f')

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
