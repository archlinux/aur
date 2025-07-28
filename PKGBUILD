# Author:      Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Shinlun Hsieh <yngwiexx@yahoo.com.tw>
# Contributor:  redtide <redtid3@gmail.com>
# Contributor:  Matthew Bakhtiari <contact@altf2.dev>
# Maintainer: Kazel <address at domain dot tld>

pkgname=wineasio32
_pkgname_64=wineasio
pkgver=1.3.0
pkgrel=2

pkgdesc="ASIO driver implementation for Wine - 32 bit binary"
url="https://github.com/wineasio/wineasio"
arch=('x86_64')
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')

options=('!lto' '!debug')
depends=('lib32-jack' 'wineasio')
makedepends=('gcc' 'wine-staging')

install="$pkgname".install

source=(
  "https://github.com/wineasio/wineasio/releases/download/v$pkgver/$_pkgname_64-$pkgver.tar.gz"
)

sha256sums=(
  'f8bf74c871233f65e5befecc7b4f2629f2566f84e951e363af0ad51eae516a4c'
)

build() {
  cd "$_pkgname_64-$pkgver"
  make 32
}

package() {
  cd "$_pkgname_64-$pkgver"
  install -D -m755 build32/"$pkgname".dll.so "$pkgdir"/usr/lib32/wine/i386-unix/"$pkgname".dll.so
  install -D -m644 build32/"$pkgname".dll "$pkgdir"/usr/lib32/wine/i386-windows/"$pkgname".dll
}
# vim:set ts=2 sw=2 et:
