# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>

pkgname=bios_extract-git
pkgver=r127.effb120
pkgrel=1
pkgdesc='Tool for extracting individual modules from proprietary BIOS images'
arch=(i686 x86_64)
url='http://www.coreboot.org/Bios_extract'
license=(GPL2)
depends=(glibc)
makedepends=(git)
source=(git+https://github.com/coreboot/bios_extract)
sha1sums=('SKIP')

pkgver() {
  cd bios_extract
  echo r$(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd bios_extract
  make
}

package() {
  cd bios_extract
  mkdir -p "$pkgdir"/usr/bin
  install -t "$pkgdir"/usr/bin bios_extract bcpvpd ami_slab xfv/efidecomp
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
