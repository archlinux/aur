# Maintainer: Matt Harrison <matt@harrison.us.com>
# Maintained at: https://github.com/matt-h/aur-pkgbuilds

pkgname=mbusd
pkgver=0.3.0
pkgrel=1
pkgdesc="Open-source Modbus TCP to Modbus RTU (RS-232/485) gateway."
arch=('x86_64' 'i686' 'armv7h')
url="https://github.com/3cky/mbusd"
license=('BSD')
depends=('glibc')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.xz::https://github.com/3cky/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('ea54f4f26b4ae39cf00213ad3eb18a5a49eae4ad44c8ca5fac030caaeb65d6c3')

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
