# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=mbusd
pkgver=0.5.0
pkgrel=1
pkgdesc="Open-source Modbus TCP to Modbus RTU (RS-232/485) gateway."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/3cky/mbusd"
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/3cky/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('a41fc1254972d41d184d47e82b13c83577f22023f7a540d02062b704bce5c710')

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
