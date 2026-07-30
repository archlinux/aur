# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=toolshed
pkgver=2.6.0
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development."
arch=('x86_64')
url="https://github.com/nitros9project/toolshed"
license=('LicenseRef-CASM')
depends=('fuse2')
makedepends=('discount' 'git')
source=(
  "git+https://github.com/nitros9project/toolshed.git#tag=v2.6.0")
  sha256sums=('216576e8750a061c36cdab46b5e677759717516a3e575c11a35eaa4462d9ce80')

build() {
  cd "$pkgname"
  unset SOURCE_DATE_EPOCH
  make -C build/unix
}

package() {
  cd "$pkgname"
  unset SOURCE_DATE_EPOCH
  make DESTDIR="$pkgdir/" prefix=/usr -C build/unix install

  # Install license file
  sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h >LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

  # Install image for HTML manual
  install -m644 doc/cover.jpg "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
