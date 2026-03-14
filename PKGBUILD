# Maintainer: Adrian Siekierka <kontakt at asie dot pl>

pkgname=zeta86
pkgver=1.2.0
pkgrel=2
pkgdesc="Compact emulator for ZZT and Super ZZT"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://zeta.asie.pl"
license=('MIT')
depends=('sdl3' 'libpng')
makedepends=('git' 'meson')
options=('debug')
_tag=1c576f05e5a6f6c0617e806ea5696826f02e5bea
source=("git+https://codeberg.org/asie/zeta.git#tag=$_tag")
sha256sums=('3fbdd8dea94c47bbf148559816e71cc68322f6ddc5593db091bea770f5e64c0f')

build() {
  cd zeta

  rm -rf build
  meson --prefix=/usr \
    . build

  ninja -C build
}

package(){
  cd zeta

  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
