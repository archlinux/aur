# Maintainer: James Choa <triggerhappyelite at gmail dot com>
pkgname=openca-ocspd
pkgver=3.1.1
pkgrel=1
pkgdesc='OpenCA OCSP Responder'
url='https://pki.openca.org/projects/ocspd/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('bash' 'openssl')
makedepends=('libpki')
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz")
sha256sums=('10d56cecb862d94ed8742bdf52958cebe1b3f8d87625ba014b0ae2b7c4820de5')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	CFLAGS="-D_XOPEN_SOURCE -D_POSIX_C_SOURCE=200809L" ./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
	mv $pkgdir/usr/etc $pkgdir/
	chrpath -d $pkgdir/usr/sbin/ocspd
}
