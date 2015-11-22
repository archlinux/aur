# Maintainer: Kohei Suzuki <eagletmt@gmail.com>
pkgname=pt1_drv-dkms-hg
_pkgname=pt1_drv
pkgver=r141.c8688d7d6382
pkgrel=1
pkgdesc="PT1/2 driver sources for DKMS"
arch=('i686' 'x86_64')
url="http://hg.honeyplanet.jp/pt1/"
license=('unknown')
depends=('dkms' 'linux-headers')
makedepends=('mercurial')
provides=('pt1_drv-dkms')
install=dkms.install
source=("$pkgname"::hg+'http://hg.honeyplanet.jp/pt1/'
        dkms.conf
        99-pt1_drv.rules)

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "$srcdir/$pkgname/driver"
  make version.h
}

package() {
  cd "$srcdir/$pkgname/driver"

  install -dm755 "$pkgdir/usr/src/$_pkgname-$pkgver"
  install -m644 *.{c,h} Makefile "$srcdir/dkms.conf" "$pkgdir/usr/src/$_pkgname-$pkgver/"
  install -Dm644 "$srcdir/99-pt1_drv.rules" "$pkgdir/usr/lib/udev/rules.d/99-pt1_drv.rules"
}

# vim:set ts=2 sw=2 et:
sha1sums=('SKIP'
          'af3fc15f2b7e9e1fc9a8559546a0ed733f7115c6'
          'ad3c58078fbd48b8f97ea24af2b084be29210b47')
