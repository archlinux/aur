# Maintainer: Mark Blakeney <mark dot blakeney at bullet-systems dot net>
_PKGNAME="CSSC"
pkgname=${_PKGNAME,,}
pkgver=1.4.0
pkgrel=1
pkgdesc="A clone of the Unix SCCS tool suite."
arch=("i686" "x86_64")
url="http://savannah.gnu.org/projects/$pkgname"
license=("GPL2")
depends=("sh")
options=("!emptydirs")
provides=("sccs")
source=($pkgname-$pkgver.tar.gz::http://ftp.gnu.org/gnu/$pkgname/$_PKGNAME-$pkgver.tar.gz)
md5sums=('e1a973092577012f0c25421e7005f0f1')

build() {
  cd "$srcdir/$_PKGNAME-$pkgver"
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info \
      --libexecdir=/usr/lib --enable-binary
  make
}

# Can enable this check but takes a very long time to run ..
#check() {
#  cd "$srcdir/$_PKGNAME-$pkgver"
#  make check
#}

package() {
  cd "$srcdir/$_PKGNAME-$pkgver"
  make DESTDIR="$pkgdir/" install
}
