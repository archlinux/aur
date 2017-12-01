pkgname=rippled
pkgrel=1
pkgver=0.80.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('i686' 'x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs')
makedepends=('scons' 'boost')
source=(https://github.com/ripple/rippled/archive/$pkgver.tar.gz)
sha256sums=('ad8ea277ffbc072c823f35bcb9d9c94465557531d7449bfd56ef0803bd00f836')

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
	install -D -m644 doc/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 doc/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
