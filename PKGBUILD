pkgname=flutterup
pkgver=0.2.3
pkgrel=1.0
pkgdesc='A flutter wrapper, to install and package flutter packages'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/flutterup'
license=('MIT')
provides=('flutter' 'dart')
conflicts=('flutter' 'dart')
depends=('git' 'ninja')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("flutterup-v${pkgver}.tar.gz::https://github.com/Decodetalkers/flutterup/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('84121dd069d002bce03093adf4f4fe2f09189c2cf91ec7cd1a47168f8bdc3af4')

build() {
  cd ${pkgname}-$pkgver
  meson setup \
    -Dprefix=/usr \
    -Dbuildtype=release \
    build
  ninja -C build
}

package() {
  cd ${pkgname}-$pkgver
  DESTDIR="$pkgdir" ninja -C build install
}
