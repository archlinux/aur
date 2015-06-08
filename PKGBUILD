# Maintainer: Richard Layman <rlayman2000 at yahoo dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=ptex
pkgver=2.0.62
pkgrel=1
pkgdesc="Per-Face Texture Mapping for Production Rendering."
arch=(i686 x86_64)
url="http://ptex.us/"
license=('GPL' 'custom')
depends=('zlib')
makedepends=('python2' 'doxygen')
source=("https://github.com/wdas/$pkgname/tarball/v$pkgver")
md5sums=('4d264b88fcc8c95fa923c33ea3d2bad0')

build() {
  cd "$srcdir/wdas"*/src

  # python2 fix
  sed -i "s|./run_tests.py|python2 run_tests.py|" \
    tests/Makefile

  make
  make -C doc
}

package() {
  cd "$srcdir/wdas"*

  # doc path fix
  [[ -d install/doc ]] \
  && pushd install \
  && mkdir share && mv doc share \
  && popd

  # install
  cp -a install "$pkgdir/usr"

  # license
  install -d "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm644 src/doc/License.txt \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
