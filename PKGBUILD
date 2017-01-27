pkgname=rippled
pkgrel=1
pkgver=0.50.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('i686' 'x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/${pkgname}/rippled.cfg" "etc/${pkgname}/validators.txt")
depends=('protobuf' 'openssl' 'boost-libs')
makedepends=('git' 'scons' 'boost')
source=("git://github.com/ripple/rippled.git#tag=$pkgver")
sha512sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	scons
}

check() {
	cd "$srcdir/$pkgname"
	build/rippled --unittest
}

package() {
	cd "$srcdir/$pkgname"
	install -D -m644 LICENSE "${pkgdir}/usr/share/lice1nses/${pkgname}/LICENSE"
	install -D build/rippled "${pkgdir}/usr/bin/rippled"
	install -D -m644 doc/rippled-example.cfg "${pkgdir}/etc/${pkgname}/rippled.cfg"
	install -D -m644 doc/validators-example.txt "${pkgdir}/etc/${pkgname}/validators.txt"
}
