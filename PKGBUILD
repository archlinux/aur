pkgname=flutterup
pkgver=0.2.2
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
sha256sums=('9436338af7518cae3d53748a9ecf4119e42ca16063a16cbc7b954955845fdcd5')

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
