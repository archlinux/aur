# Author:      Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor:  redtide <redtid3@gmail.com>
# Maintainer:  chuckdaniels <ismgonval@gmail.com>

pkgname=wineasio
pkgver=1.0.0
pkgrel=1

pkgdesc="ASIO driver implementation for Wine"
url="https://github.com/wineasio/wineasio"
arch=('i686' 'x86_64')
license=('LGPL')

depends=('wine' 'jack' 'realtime-privileges')
depends_x86_64+=('lib32-jack')
makedepends_x86_64+=('gcc-multilib')

install="$pkgname".install

source=(
  "https://github.com/wineasio/wineasio/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz"
)
sha256sums=(
  'b550d34e6c5ba3c2accffda96fa5624b725680d862227254372d1349a0b5587f'
)
build() {
  cd "$pkgname-$pkgver"
  make 32
  if [[ "$CARCH" == x86_64 ]]; then
    make 64
  fi
}
package() {
  cd "$pkgname-$pkgver"
  if [[ "$CARCH" == x86_64 ]]; then
    install -D -m755 build32/"$pkgname".dll.so "$pkgdir"/usr/lib32/wine/"$pkgname".dll.so
    install -D -m755 build64/"$pkgname".dll.so "$pkgdir"/usr/lib/wine/"$pkgname".dll.so
  else
    install -D -m755 build32/"$pkgname".dll.so "$pkgdir"/usr/lib32/wine/"$pkgname".dll.so
  fi
  install -D -m644 README.md "$pkgdir"/usr/share/"$pkgname"/README.md
}
# vim:set ts=2 sw=2 et:
