# Maintainer: Marat Akhin <Marat.Akhin@gmail.com>

pkgname=boolector
pkgver=2.2.0
pkgrel=1
pkgdesc="Boolector is an efficient SMT solver for the quantifier-free theory of bit-vectors in combination with the quantifier-free extensional theory of arrays."
arch=('i686' 'x86_64')
url="http://fmv.jku.at/boolector/"
license=('custom')
makedepends=()
conflicts=()

install="boolector.install"

source=("http://fmv.jku.at/boolector/boolector-2.2.0-with-lingeling-bal.tar.bz2")
md5sums=('734654adb0496ea4e8a83cdf8577c857')

build() {
  cd "$srcdir/boolector-2.2.0-with-lingeling-bal"
  CFLAGS="" make
}

package() {
  mkdir -p "$pkgdir/usr/bin/"
  mkdir -p "$pkgdir/usr/lib/"

  cd "$srcdir/boolector-2.2.0-with-lingeling-bal/lingeling"
  mkdir -p "$pkgdir/usr/include/lingeling"
  install -m644 *.h "$pkgdir/usr/include/lingeling/"
  install -m644 *.a "$pkgdir/usr/lib/"
  install -m644 lingeling "$pkgdir/usr/bin/"

  cd "$srcdir/boolector-2.2.0-with-lingeling-bal/boolector"
  mkdir -p "$pkgdir/usr/include/boolector"
  install -m644 *.h "$pkgdir/usr/include/boolector/"
  install -m644 *.a "$pkgdir/usr/lib/"
  install -m644 boolector "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/share/licenses/boolector"
  install -m644 \
    "$srcdir/boolector-2.2.0-with-lingeling-bal/boolector/COPYING" \
    "$pkgdir/usr/share/licenses/boolector/LICENSE"
}
