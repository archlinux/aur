# Maintainer: Anatol Pomozov <anatol.pomozov@gmail.com>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>

pkgname=uefivars-git
pkgver=r1.1f22f91
pkgrel=1
pkgdesc='A tool to populate UEFI Runtime Variables. Requires the kernel module efivars to be loaded.'
arch=(i686 x86_64)
url='https://github.com/fpmurphy/Various/tree/master/uefivars-2.0'
license=(GPL)
depends=(efibootmgr)
makedepends=(git)
source=(git://github.com/fpmurphy/Various)
sha1sums=('SKIP')

pkgver() {
  cd Various/uefivars-2.0
  echo r$(git rev-list --count master .).$(git rev-parse --short master)
}

prepare() {
  cd Various/uefivars-2.0
  # uefivars-git does not respect CFLAGS, fix it
  sed -e 's/CFLAGS = $(EXTRA_CFLAGS)/CFLAGS += $(EXTRA_CFLAGS)/' -i Makefile
}

build() {
  cd Various/uefivars-2.0
  make
}

package() {
  cd Various/uefivars-2.0
  install -D -m755 src/uefivars/uefivars "$pkgdir"/usr/bin/uefivars
}
