# Maintainer: Ralph Holmes <ybden@ybden.com>
# Contributor: Matheus de Alcantara <matheus.de.alcantara@gmail.com>

pkgname=libz
pkgver=1.2.8.2015.12.26
pkgrel=1
pkgdesc='An ABI-compatible and API-compatible drop-in replacement for zlib'
arch=('i686' 'x86_64')
url="http://sortix.org/$pkgname/"
license=('custom')
provides=('zlib')
conflicts=('zlib')
source=("https://sortix.org/$pkgname/release/$pkgname-$pkgver.tar.gz")
sha256sums=('abcc2831b7a0e891d0875fa852e9b9510b420d843d3d20aad010f65493fe4f7b')

prepare() {
	cd $pkgname-$pkgver
	grep -A24 'Copyright' zlib.h | sed 's/  //' >LICENSE
}

build() {
	cd $pkgname-$pkgver
	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver
	make install DESTDIR=$pkgdir
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
