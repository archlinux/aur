# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=toolshed
pkgver=2.4.2
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development."
arch=('x86_64')
url="https://github.com/nitros9project/toolshed"
license=('PerlArtistic')
depends=('fuse2')
makedepends=('discount' 'git')
source=("git+https://github.com/nitros9project/toolshed.git#tag=v2_4_2")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  make -C build/unix
}

check() {
  cd "$pkgname"
  tests/hybrid-dsk.sh
  tests/multihdb-dsk.sh
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir/" -C build/unix install

  # Install license file
  sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h >LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Install image for HTML manual
  install -m644 doc/cover.jpg "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
