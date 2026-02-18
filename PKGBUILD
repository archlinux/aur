# Maintainer: Adrian Siekierka <kontakt at asie dot pl>

pkgname=zeta86
pkgver=1.1.5
pkgrel=1
pkgdesc="Compact emulator for ZZT and Super ZZT"
arch=('i686' 'x86_64' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://zeta.asie.pl"
license=('MIT')
depends=('sdl3' 'libpng')
makedepends=('git' 'meson')
options=('debug')
_tag=445f231f0db88eb7023161ad886fab1f587ce835
source=("git+https://codeberg.org/asie/zeta.git#tag=$_tag")
sha256sums=('5338521632910ad86602dc9083c6b8cfad45d124971df62e09e24ef78b1b94a4')

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
