# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=3.8.2
pkgrel=1
arch=('x86_64')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=https://www.libressl.org
license=('isc' 'custom:Openssl')
depends=('ca-certificates')
makedepends=('libbsd')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz")
sha256sums=('6d4b8d5bbb25a1f8336639e56ec5088052d43a95256697a85c4ce91323c25954')

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

