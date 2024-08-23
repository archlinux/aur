# Maintainer: Mark Blakeney <mark dot blakeney at bullet-systems dot net>
_pkgname="CSSC"
pkgname="${_pkgname,,}"
pkgver=1.4.1
pkgrel=1
pkgdesc="A clone of the Unix SCCS tool suite."
arch=("i686" "x86_64")
url="http://savannah.gnu.org/projects/$pkgname"
license=(GPL-2.0-or-later)
depends=("sh")
options=("!emptydirs")
provides=("sccs")
source=($pkgname-$pkgver.tar.gz::http://ftp.gnu.org/gnu/$pkgname/$_pkgname-$pkgver.tar.gz)
md5sums=('c9aaae7602e39b7a5d438b0cc48fcaa3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info \
      --libexecdir=/usr/lib --enable-binary
  make
}

# Can enable this check but takes a very long time to run ..
#check() {
#  cd "$srcdir/$_pkgname-$pkgver"
#  make check
#}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
