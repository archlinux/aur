# Maintainer: Adrian Siekierka <kontakt at asie dot pl>

pkgname=zeta86
pkgver=1.2.0
pkgrel=1
pkgdesc="Compact emulator for ZZT and Super ZZT"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://zeta.asie.pl"
license=('MIT')
depends=('sdl3' 'libpng')
makedepends=('git' 'meson')
options=('debug')
_tag=76ad151aa70fa62828a94d05af5a772ba9edee64
source=("git+https://codeberg.org/asie/zeta.git#tag=$_tag")
sha256sums=('46df8dbe34f129f86ca629ad4291117cb6d90ac3833aa1d690104ae11c1da0b5')

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
