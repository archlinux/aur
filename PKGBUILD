# Maintainer: Albert Graef <aggraef@gmail.com>

pkgname=faust2pd
pkgver=2.12
pkgrel=1
pkgdesc="Generate Pd GUI abstractions from Faust programs"
arch=("i686" "x86_64")
license=('GPL3')
url="http://purelang.bitbucket.org/"
depends=('pure' 'pure-xml' 'pd' 'curl')
makedepends=('faust')
groups=(pure-complete pure-multimedia)
source=("https://bitbucket.org/purelang/pure-lang/downloads/$pkgname-$pkgver.tar.gz")
md5sums=('2ef0fd7b5aa22986ac9ec6c36fd073da')

# NOTE: The tarball contains C++ sources generated from the Faust programs,
# which may need updating, depending on the Faust version we're compiling
# with. To be on the safe side, we just clean out all generated sources with
# 'make realclean' in order force a recompile.

build() {
  cd $srcdir/$pkgname-$pkgver
  make prefix=/usr PUREC_FLAGS=-mcpu=generic realclean all examples
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir prefix=/usr install install-pd
  install -d $pkgdir/usr/lib/pd/extra/faust2pd
  cp -r examples $pkgdir/usr/lib/pd/extra/faust2pd
}
