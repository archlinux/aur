# Maintainer: Alexander F Rødseth <xyproto@archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Tobias Powalowski <t.powa@gmx.de>
# AUR pv-static pkg: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=pwgen-static
_pkgname=pwgen
pkgver=2.08
pkgrel=1
pkgdesc='Password generator for creating easily memorable passwords'
arch=('x86_64' 'aarch64')
url='https://sourceforge.net/projects/pwgen/'
license=('GPL')
makedepends=('musl' 'gcc' 'make')
provides=(pwgen)
conflicts=(pwgen)
validpgpkeys=('3AB057B7E78D945C8C5591FBD36F769BC11804F0')
source=("https://downloads.sourceforge.net/sourceforge/${_pkgname}/${_pkgname}-$pkgver.tar.gz"{,.asc})
sha256sums=('dab03dd30ad5a58e578c5581241a6e87e184a18eb2c3b2e0fffa8a9cf105c97b'
            'SKIP')
# prepare() {
#   cd "$_pkgname-$pkgver"
#   autoconf
# }
build() {
  cd "$_pkgname-$pkgver"
  export CC=musl-gcc CFLAGS="$CFLAGS -Os" LDFLAGS="$LDFLAGS -static"
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}
package() {
  make -C "$_pkgname-$pkgver" DESTDIR="$pkgdir" install
  strip $pkgdir/usr/bin/pwgen
}

# getver: sf.net/p/pwgen/code/ci/master/tree/Makefile.in?format=raw
# vim: ts=2 sw=2 et:
