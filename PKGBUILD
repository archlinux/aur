# Maintainer: Arthur Zamarin <arthurzam@gmail.com> 

pkgname=asmail
pkgver=2.1
pkgrel=4
pkgdesc="AfterStep mail monitor"
arch=(i686 x86_64)
url="https://packages.debian.org/en/sid/mail/${pkgname}"
license=('GPL2')
depends=('libxpm')
source=("http://ftp.us.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}.orig.tar.gz"
        "http://ftp.us.debian.org/debian/pool/main/a/${pkgname}/${pkgname}_${pkgver}-${pkgrel}.diff.gz")
sha256sums=('9b20aff43d61511e9c24af5603a546e3709bad35c769074e2b66d818f33e8191'
            'f007c10912322926ae706514107465e00a723fe2d83e420c8b9039ca2073336d')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i ../${pkgname}_${pkgver}-${pkgrel}.diff
  ./configure
  sed -i "s@/usr/local@\$(DESTDIR)/usr@" Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
