pkgname=flutterup
pkgver=0.2.0
pkgrel=1.0
pkgdesc='A flutter wrapper, to install and package flutter packages'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/flutterup'
license=('MIT')
provides=('flutter' 'dart')
depends=('git')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("flutterup-v${pkgver}.tar.gz::https://github.com/Decodetalkers/flutterup/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cbb607dc978437c5b8cda8f9d0beaa7674b92f12c828ea96a8a97f126dfc63ce')

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
