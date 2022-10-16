# Author:      Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor:  redtide <redtid3@gmail.com>
# Contributor:  Matthew Bakhtiari <contact@altf2.dev>
# Contributor: Kazel <address at domain dot tld>
# Maintainer: Blallo <blallo@autistici.org>

pkgname=wineasio-pipewire
pkgorigname=wineasio
pkgver=1.1.0
pkgrel=3

pkgdesc="ASIO driver implementation for Wine (using pipewire libraries)"
url="https://github.com/wineasio/wineasio"
arch=('x86_64')
license=('LGPL')

depends=('jack' 'lib32-pipewire-jack' 'realtime-privileges' 'wine')
makedepends=('gcc-multilib')

install="$pkgname".install

source=(
  "https://github.com/wineasio/wineasio/releases/download/v$pkgver/$pkgorigname-$pkgver.tar.gz"
)
sha256sums=(
  'aa26ec986878d3fee1b99d0b31d0085379a78fcace20defbaf9627f007e2f2cc'
)

build() {
  cd "$pkgorigname-$pkgver"
  make 32
  make 64
}

package() {
  cd "$pkgorigname-$pkgver"
  install -D -m755 build32/"$pkgorigname".dll.so "$pkgdir"/usr/lib32/wine/i386-unix/"$pkgorigname".dll.so
  install -D -m644 build32/"$pkgorigname".dll "$pkgdir"/usr/lib32/wine/i386-windows/"$pkgorigname".dll
  install -D -m755 build64/"$pkgorigname".dll.so "$pkgdir"/usr/lib/wine/x86_64-unix/"$pkgorigname".dll.so
  install -D -m644 build64/"$pkgorigname".dll "$pkgdir"/usr/lib/wine/x86_64-windows/"$pkgorigname".dll
  install -D -m644 README.md "$pkgdir"/usr/share/"$pkgorigname"/README.md
}
# vim:set ts=2 sw=2 et:
