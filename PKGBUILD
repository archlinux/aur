# Maintainer: a821 at mail de
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick Smallbone <nick.smallbone@gmail.com>

pkgname=tofrodos
pkgver=1.9.0
pkgrel=1
arch=('x86_64')
pkgdesc="Convert ASCII files between the MS-DOS/Windows format and the UNIX format"
url="https://www.thefreecountry.com/tofrodos/"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ChristopherHeng/tofrodos/archive/$pkgver.tar.gz"
        "Makefile.patch")
sha512sums=('0ae149efa7a8901f48c809bd491c18813ea4d8c0c087865ec6ac8adf042e00875cc0d6361a024ce220caa216294255b9297fb145c5260285880cdec0ebb69647'
            '196d32582796e3cde31b3e34832949763a4987c76041a0f7fb8e2f70b19583aa2bbc17d2975af0be04d66f635318989da1d60b79fdab99a849d0f1e1f1bd69ba')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 < ../Makefile.patch
  mv makefile.gcc Makefile
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir" install
}
