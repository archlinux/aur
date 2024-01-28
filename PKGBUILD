# Maintainer: Julian Pollinger <julian@pollinger.dev>
pkgname=glpk-cut-log
pkgdesc="A patched version of GLPK for cvc5"
pkgver=1.1.1
pkgrel=1
_glpkver=4.52
arch=('x86_64')
url="https://github.com/cvc5/cvc5"
license=('GPL3')
depends=()
makedepends=('bash' 'automake' 'autoconf' 'libtool' 'patch')
source=("$url/archive/refs/tags/cvc5-$pkgver.tar.gz" "https://ftp.gnu.org/gnu/glpk/glpk-$_glpkver.tar.gz")
sha256sums=('4747502675a778d4bf5ae9590adff0c3a8258b1198098cc39ac537b0cc7802cd'
            '9a5dab356268b4f177c33e00ddf8164496dc2434e83bd1114147024df983a3bb')
conflicts=('glpk')
provides=("glpk=$pkgver")

prepare() {
  _patch_file="$srcdir/cvc5-cvc5-$pkgver/contrib/glpk-cut-log.patch"
  cd "$srcdir/glpk-$_glpkver"
  patch -p1 < "$_patch_file"
}

build() {
  cd "$srcdir/glpk-$_glpkver"

  libtoolize
  aclocal
  autoheader
  autoconf
  automake --add-missing

  ./configure --prefix="$pkgdir/usr"

  make

}

package() {
  cd "$srcdir/glpk-$_glpkver"
  make install
}
