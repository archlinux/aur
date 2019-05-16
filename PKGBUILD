# Maintainer: Kovshov K.A. <kirillnow at gmail dot com>
# Maintainer: Stuart Cardall <developer at it-offshore dot co dot uk>
# Contributor: Stuart Cardall <developer at it-offshore dot co dot uk>

pkgname=secpwgen
pkgver=1.3
pkgrel=5
pkgdesc="Secure password generator"
url='http://zvrba.net/'
arch=('x86_64')
license=('MIT')
depends=('openssl')
source=("https://github.com/itoffshore/$pkgname/archive/v$pkgver.tar.gz" 
	"makefile.patch")
sha512sums=('a18b5405ae5f6a62c25dd61654ea897b2f099fa459530bc6cfdbe79d96bfa6b4943e4ba2456ad5355d37cababe585299638afe56ff1a9fc649b6df0b7aa1e269'  
            'SKIP')

prepare() {
  cd ${pkgname}-${pkgver}
  patch Makefile.proto < "${srcdir}/makefile.patch"
}

build() {
	cd "$pkgname-$pkgver"
	mv Makefile.proto Makefile
	make
}

package() {
	cd "$pkgname-$pkgver"

	mkdir -p "$pkgdir"/usr/bin \
		"$pkgdir"/usr/share/man/man1
	install -m 755 secpwgen "$pkgdir"/usr/bin
	install -m 644 secpwgen.1 "$pkgdir"/usr/share/man/man1
}