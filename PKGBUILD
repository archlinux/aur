pkgname=rippled
pkgrel=1
pkgver=0.60.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('i686' 'x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/$pkgname/rippled.cfg" "etc/$pkgname/validators.txt")
depends=('protobuf' 'openssl' 'boost-libs')
makedepends=('git' 'scons' 'boost')
source=(https://github.com/ripple/rippled/archive/$pkgver.tar.gz)
md5sums=('a18cc9503cd6cd3b90882a547d4b0134')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	scons
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	build/rippled --unittest
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/lice1nses/$pkgname/LICENSE"
	install -D build/rippled "${pkgdir}/usr/bin/rippled"
	install -D -m644 doc/rippled-example.cfg "${pkgdir}/etc/$pkgname/rippled.cfg"
	install -D -m644 doc/validators-example.txt "${pkgdir}/etc/$pkgname/validators.txt"
}
