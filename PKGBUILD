pkgname=rippled
pkgrel=0
pkgver=develop
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs')
makedepends=('cmake' 'boost' 'clang' 'doxygen')
source=("https://github.com/ripple/rippled/archive/$pkgver.zip")
sha256sums=('SKIP')

build() {
	cmake -Dtarget=clang.release.unity -Dstatic=OFF "$srcdir/$pkgname-$pkgver"
	cmake --build .
}

check() {
	"${srcdir}/rippled" --unittest
}

package() {
	install -D rippled "${pkgdir}/usr/bin/rippled"
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
