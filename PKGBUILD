# Maintainer: Adrian Siekierka <kontakt at asie dot pl>

pkgname=zeta86
pkgver=1.2.1
pkgrel=1
pkgdesc="Compact emulator for ZZT and Super ZZT"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://zeta.asie.pl"
license=('MIT')
depends=('sdl3' 'libpng')
makedepends=('git' 'meson')
options=('debug')
_tag=10487fbdadcc2069d95cd978905eb892418c1819
source=("git+https://codeberg.org/asie/zeta.git#tag=$_tag")
sha256sums=('2ca70a5dc5f269a8c15226eb75c4c33d86e773e72c0694518f8230ba85e538d2')

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
