pkgname=rippled-git
pkgrel=1
pkgver=develop
pkgdesc="Ripple peer-to-peer network daemon"
arch=('x86_64')
url="https://github.com/ripple/rippled"
license=('custom:ISC')
backup=("etc/opt/ripple/rippled.cfg" "etc/opt/ripple/validators.txt")
depends=('protobuf' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'clang' 'doxygen')
source=("https://github.com/ripple/rippled/archive/develop.zip")
sha256sums=('SKIP')

build() {
	cmake -Dstatic=OFF "$srcdir/rippled-develop"
	cmake --build . -j 4
}

check() {
	"${srcdir}/rippled" --unittest
}

package() {
	install -D rippled "${pkgdir}/usr/bin/rippled"
	cd "$srcdir/rippled-develop"
	install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/ripple/LICENSE"
	install -D -m644 cfg/rippled-example.cfg "${pkgdir}/etc/opt/ripple/rippled.cfg"
	install -D -m644 cfg/validators-example.txt "${pkgdir}/etc/opt/ripple/validators.txt"
}
