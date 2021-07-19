# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=bdsync
pkgver=0.11.2
pkgrel=1
pkgdesc="Fast block device synchronizing tool"
arch=("i686" "x86_64")
url="https://github.com/rolffokkens/bdsync"
license=('GPL')
depends=("openssl")
makedepends=("pandoc")
source=("git+https://github.com/rolffokkens/$pkgname#tag=v${pkgver}")
sha256sums=('SKIP')


prepare() {
  cd "$pkgname"
  sed -i -r 's|^CFLAGS=(.*)|CFLAGS:=\1 $(CFLAGS)|' Makefile
  sed -i -r 's|$\(CRYPTO_LDFLAGS\)$|\0 $(LDFLAGS)|' Makefile
}

build() {
  cd "$pkgname"

  CFLAGS="${CFLAGS//-O2/-O3}"
  make
}

package() {
  cd "$pkgname"
  install -D -m755 bdsync "$pkgdir/usr/bin/bdsync"
  install -D -m644 bdsync.1 "$pkgdir/usr/share/man/man1/bdsync.1"
}

# vim:set ts=2 sw=2 et:
