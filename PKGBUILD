

Maintainer="Micah Nordland <mpnordland@gmail.com>"
pkgname=net-responsibility
pkgver=3.0.3
pkgrel=6
pkgdesc="An Internet Accountablity software written in C++ for Linux, Windows, and Mac OS X"
arch=('i686' 'x86_64')
url="http://www.netresponsibility.com"
license=('gpl')
depends=('poco' 'libpcap')
makedepends=('gcc' 'make' 'patch')
options=()
source=("https://bitbucket.org/netresponsibilityteam/net-responsibility/downloads/$pkgname-$pkgver.tar.gz" "Makefile.patch" "net-responsibility.service")
md5sums=('d757a4429507de92ceac517dab04ca5c'
         'b7436f6e9dc2ac5993dc0dd17bf08f4a'
         '46fc73d3c72361c6a1b7cad80c075f0d')

install=$pkgname.install

build() {
 cd $srcdir/$pkgname-$pkgver
 patch ./Makefile.am < $srcdir/Makefile.patch
 autoreconf -i 
 ./configure
 make || return 1
}


package()
{
 cd $srcdir/$pkgname-$pkgver
 make DESTDIR=$pkgdir install
 mkdir -p $pkgdir/etc/systemd/system/
 cp $srcdir/net-responsibility.service $pkgdir/etc/systemd/system/
 
}


