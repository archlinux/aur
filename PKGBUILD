# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: bitwave <bitwave [aTT] oomlu [dOot] de>
# Contributor: Jan Stępień <jstepien@users.sourceforge.net>
# Contributor: aperez

pkgname=zpipe
pkgver=201
pkgrel=3
pkgdesc="Incremental Journaling Backup Utility and Archiver"
arch=('i686' 'x86_64')
url="http://mattmahoney.net/dc/zpaq.html"
license=('GPL')
depends=('zpaq')
source=(http://mattmahoney.net/dc/zpipe.201.zip zpipe.patch)
sha512sums=('d126187ca868ccd0092f63bb47ac9fa7ebb6befb3f5de03857ee14b7e5e9177ba7c9b04c9e5a3b7dc3743773d0602882e00d877fa4daca9fab27922c30bda4ee'
            '6e7cf16521cbc39062010f016fdc85a1b4518ac37bc4d09ecbfc10895ca2b76c3602f2460fbc02a8fda332d937d6edf13d58a4cbf90325fa4d8dfb5207d9dad2')

prepare() {
  dos2unix "$srcdir/zpipe.cpp"
  patch -l -p1 "$srcdir/zpipe.cpp" zpipe.patch
}

build() {
  make -C $srcdir zpipe LDLIBS+="-lzpaq"
}

package() {
  mkdir -p $pkgdir/usr/bin
  install -Dm755 $srcdir/zpipe $pkgdir/usr/bin
}
