# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=3.2.3
pkgrel=1
arch=('x86_64')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=https://www.libressl.org
license=('isc' 'custom:Openssl')
depends=('ca-certificates')
makedepends=('libbsd')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz")
sha256sums=('412dc2baa739228c7779e93eb07cd645d5c964d2f2d837a9fd56db7498463d73')

build() {
cd $srcdir/libressl-${pkgver}/
./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --enable-nc --disable-static \
	--disable-shared --with-pic=yes
make
}

check() {
cd $srcdir/libressl-${pkgver}/
make -k check
}

package() {
cd $srcdir/libressl-${pkgver}
install -Dm 755 ./apps/nc/nc $pkgdir/usr/bin/nc
ln -s nc $pkgdir/usr/bin/netcat
install -Dm 644 ./apps/nc/nc.1 $pkgdir/usr/share/man/man1/nc.1
install -Dm 644 ./COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

