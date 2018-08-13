# Maintainer: James Choa <triggerhappyelite at gmail dot com>
pkgname=openca-ocspd
pkgver=3.1.2
pkgrel=1
pkgdesc='OpenCA OCSP Responder'
url='https://pki.openca.org/projects/ocspd/'
arch=('i686' 'x86_64')
license=('Apache')
depends=('bash' 'openssl')
makedepends=('libpki' 'chrpath')
source=("http://prdownloads.sourceforge.net/project/openca/$pkgname/releases/v$pkgver/sources/$pkgname-$pkgver.tar.gz")
sha256sums=('fdba65ee232b03668563acbcb09a57aaadb2b4d140ceec7b58ec8b274f61a62d')

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
