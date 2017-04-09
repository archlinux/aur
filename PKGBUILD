pkgname=coin-or-ipopt
pkgver=3.12.7
pkgrel=1
pkgdesc="Interior Point OPTimizer"
arch=('i686' 'x86_64')
url="https://projects.coin-or.org/Ipopt"
license=('EPL')
groups=('coin-or')
depends=('lapack')
makedepends=('gcc-fortran' 'wget')
source=("http://www.coin-or.org/download/source/Ipopt/Ipopt-$pkgver.tgz")
sha1sums=('2a36e4a04717a8ed7012ac7d1253ae4ffbc1a8fd')

build() {
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/ASL" && ./get.ASL
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/Metis" && ./get.Metis
  cd "$srcdir/Ipopt-$pkgver/ThirdParty/Mumps" && ./get.Mumps
  cd "$srcdir/Ipopt-$pkgver"
  mkdir -p build && pushd build
  ../configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/Ipopt-$pkgver/build"
  PKG_CONFIG_LIBDIR="${pkgdir}/usr/lib/pkgconfig/" \
  make DESTDIR="$pkgdir/" install
}

