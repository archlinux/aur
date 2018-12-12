# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Pranay Kanwar <pranay.kanwar@gmail.com>

pkgname=btscanner
pkgver=2.1
pkgrel=5
pkgdesc="Bluetooth device scanner."
url="http://www.pentest.co.uk"
depends=('bluez-libs' 'libxml2')
arch=(i686 x86_64)
license=('GPL')
changelog=$pkgname.changelog
source=(http://www.pentest.co.uk/src/$pkgname-$pkgver.tar.bz2
       $pkgname.patch)
source=(http://web.archive.org/web/20070711171847/http://www.pentest.co.uk/src/$pkgname-$pkgver.tar.bz2
       $pkgname.patch)
md5sums=('587ec5847647d432eac1704b260af020'
         '606530db564f269ce245997e30f9fe86')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 -b -z .orig -i ../$pkgname.patch
  mv configure.in configure.ac
  autoreconf -fiv
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconf=/etc/btscanner --datadir=/usr/share/btscanner
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  # this is the only documentation
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 USAGE  "${pkgdir}/usr/share/doc/${pkgname}/USAGE"
}
