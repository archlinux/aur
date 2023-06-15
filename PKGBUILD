pkgname=flutterup
pkgver=0.2.1
pkgrel=1.0
pkgdesc='A flutter wrapper, to install and package flutter packages'
arch=('x86_64' 'aarch64')
url='https://github.com/Decodetalkers/flutterup'
license=('MIT')
provides=('flutter' 'dart')
depends=('git')
makedepends=('git' 'ninja' 'meson' 'rust')
source=("flutterup-v${pkgver}.tar.gz::https://github.com/Decodetalkers/flutterup/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f5b5ab0b22bf686094b8b12e139d0656fcae4dd39b36d5c4ddb3007c36fc3b50')

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
