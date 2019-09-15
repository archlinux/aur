# Maintainer: Peter Tirsek <peter@tirsek.com>

pkgname=rlpr
pkgver=2.04
pkgrel=1
epoch=
pkgdesc="Send print jobs directly to remote lpd servers"
arch=('i686' 'x86_64')
url= # Maybe http://truffula.com/rlpr, but there's no web server at that address :-(
license=('GPL')
source=(
	"https://www.openprinting.org/download/printing/$pkgname-$pkgver.tar.gz"
	"$pkgname-$pkgver.patch"
)
sha256sums=(
	'3aa1d7792eb1b0634148b96eaf647e173abe1915564727e893857eeb24e4b78f'
	'f7bfcfac87f65bb022d6b9df6b1cc29e288c503b8ba9c7bae4967bdc012b1a37'
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
