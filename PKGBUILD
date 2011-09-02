# Contributor: Marti Raudsepp <marti@juffo.org>
pkgname=sam7utils
pkgver=0.2.1
pkgrel=2
pkgdesc="A utility for programming AT91SAM7 series microcontrollers over USB"
arch=(i686 x86_64)
license=('GPL')
options=('buildflags')
url="http://oss.tekno.us/sam7utils/"
depends=('libusb-compat' 'readline' 'udev')
# Original source: http://oss.tekno.us/sam7utils/$pkgname-$pkgver.tar.gz
source=(http://txrxio.net/wp/basket/makingthings/$pkgname-$pkgver.tar.gz
        50-atmel-samba.rules)
md5sums=('4027a3d06500b9e4911b3f548ad7b138'
         'b3753f3577784190fd4e0ef5d6075323')

build() {
  cd $srcdir/$pkgname-$pkgver
  CFLAGS="$CFLAGS -Wno-error=unused-but-set-variable"
  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR=$pkgdir install || return 1

  install -d $pkgdir/etc/udev/rules.d
  install $srcdir/50-atmel-samba.rules $pkgdir/etc/udev/rules.d
}
