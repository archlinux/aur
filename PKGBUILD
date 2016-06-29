# Maintainer=alive4ever
pkgname=libressl-netcat
pkgver=2.4.1
pkgrel=2
arch=('x86_64' 'i686')
pkgdesc="Low level UDP/TCP connection tool with support for TLS protocol"
url=http://www.libressl.org
license=('bsd' 'custom:Openssl')
depends=('glibc' 'ca-certificates')
provides=('netcat')
conflicts=('openbsd-netcat' 'gnu-netcat')
source=("http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz"
	"http://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-${pkgver}.tar.gz.asc")
sha256sums=('121922b13169cd47a85e3e77f0bc129f8d04247193b42491cb1fab9074e80477'
            'SKIP')
validpgpkeys=('A1EB079B8D3EB92B4EBD3139663AF51BD5E4D8D5') # Brent Cook <bcook@openbsd.org>

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

