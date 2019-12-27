# Maintainer: Peter Tirsek <peter@tirsek.com>

pkgname=rlpr
pkgver=2.06
pkgrel=1
epoch=
pkgdesc="Send print jobs directly to remote lpd servers"
arch=('i686' 'x86_64')
url= # Maybe http://truffula.com/rlpr, but there's no web server at that address :-(
license=('GPL')
source=(
	"http://linuxfocus.org/~guido/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.patch"
)
sha256sums=(
	'32ae5893f4b9250b7a02c98a41b5929cfdd5731b6efbd7edfc77c2c5314388f7'
	'c17c75164ed4e9e433a38bc583f84b25cf5a23b4750ad46cf830aa95e9a38fda'
)

prepare() {
	cd "$pkgname-$pkgver"
	patch -p0 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	CPPFLAGS="-D_FORTIFY_SOURCE=2 -O2" ./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
