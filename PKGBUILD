# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=dosh
pkgver=1.7
pkgrel=1
pkgdesc='Docker shell'
arch=('any')
url="https://github.com/gportay/$pkgname"
license=('MIT')
depends=('docker')
makedepends=('asciidoctor')
checkdepends=('shellcheck')
source=("https://github.com/gportay/$pkgname/archive/$pkgver.tar.gz")
md5sums=('58170baefc8008e7fe2dc6e3486ff27e')

build() {
	cd "$pkgname-$pkgver"
	make doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" PREFIX="/usr" install
	install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
