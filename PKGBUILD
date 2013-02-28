# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-cl
pkgver=1.0
pkgrel=3
arch=('x86_64' 'i686')
pkgdesc='OpenCL binding for Erlang'
url="http://github.com/tonyrog/cl"
license=('custom:unknown')
depends=('erlang' 'libcl' 'bash')
replaces=('cl')
makedepends=('opencl-headers')
source=("$pkgname-$pkgver.tar.gz::https://nodeload.github.com/tonyrog/cl/tar.gz/master")
sha256sums=('76991eba2418ced8e28f4237878e1ec8bb231193c614dab63623ff518b2dc56c')
if [ "$CARCH" = "x86_64" ]
then
  _wordsize=64
else
  _wordsize=32
fi
_dirname='cl-master'

build() {
  cd "$srcdir/$_dirname/c_src"

  make configure
  ./configure --with-wordsize="$_wordsize" --prefix=/usr
  make "all$_wordsize"
  rm config.*
}

package() {
  cd "$srcdir/$_dirname"

  mkdir -p "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  cp -r * "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
