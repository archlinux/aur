# Maintainer: Paul Hentschel <aur at hpminc dot com>

pkgname=toolshed
pkgver=2.6.1
pkgrel=1
pkgdesc="Utilities for Tandy Color Computer and Dragon microcomputers cross-development."
arch=('x86_64')
url="https://github.com/nitros9project/toolshed"
license=('LicenseRef-CASM')
depends=('fuse2')
makedepends=('discount' 'git')
source=(
  "git+https://github.com/nitros9project/toolshed.git#tag=v2.6.1"
  "LICENSE")

sha256sums=('50a668352cd975514c00dbcea16ba70e507711f820dfb8165ff975db1d4a5f4a'
            'be7db99354b7c0a516ecae7fbb9b91f920e6732082dfd9e9a9b01c97f91d5a91')

prepare() {
  cd "$pkgname"
  #patch -Np1 -i "$srcdir/xxx.patch"
}

build() {
  cd "$pkgname"
  make -C build/unix
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" prefix=/usr -C build/unix install

  # Install license file
  #sed -n '/Copyright/,/PARTICULAR PURPOSE./p' casm/src/util.h >LICENSE
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENSE"

  # Install image for HTML manual
  install -Dm644 doc/cover.jpg "$pkgdir/usr/share/doc/$pkgname/"
}

# vim:set ts=2 sw=2 et:
