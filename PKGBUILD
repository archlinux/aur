pkgname=rippled
pkgrel=1
pkgver=1.4.0
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs' 'openssl')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
source=("https://github.com/ripple/rippled/archive/$pkgver.zip")
sha256sums=('ca4626c7e94b28db9c0fcdbaf3ea135199d09fa8c1a841006a6c952845d63cca')

build() {
	cmake -Dtarget=clang.release.unity -Dstatic=OFF "$srcdir/$pkgname-$pkgver"
	cmake --build .
}

#check() {
#	"${srcdir}/rippled" --unittest
#}

package() {
	install -D rippled "${pkgdir}/usr/bin/rippled"
	cd "$srcdir/$pkgname-$pkgver"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
