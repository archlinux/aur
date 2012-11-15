# $Id: PKGBUILD 61589 2012-01-03 23:37:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: kappa <kappacurve@gmail.com>

pkgname=erlang-cl
pkgver=1.0
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='OpenCL binding for Erlang'
url="http://github.com/tonyrog/cl"
license=('custom:unknown')
depends=('erlang' 'libcl' 'bash')
replaces=('cl')
makedepends=('opencl-headers')
source=("$pkgname-$pkgver.tar.gz::https://nodeload.github.com/tonyrog/cl/tar.gz/master")
sha256sums=('e2cb407489ebe1d8e8f287283eb5c715d559ce95255f6bbcac137cb84c500be6')
_dirname='cl-master'
if [ "$CARCH" = "x86_64" ]
then
  _wordsize=64
else
  _wordsize=32
fi

build() {
  cd "$srcdir/$_dirname/c_src"

  make configure
  ./configure --with-wordsize=$_wordsize --prefix=/usr
  make all$_wordsize
  rm config.*
}

package() {
  cd "$srcdir/$_dirname"

  mkdir -p "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
  cp -r * "$pkgdir/usr/lib/erlang/lib/cl-$pkgver"
}

# vim:set ts=2 sw=2 et:
