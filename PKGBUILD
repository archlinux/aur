# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Clint Valentine <valentine.clint@gmail.com>

pkgname=xs
pkgver=2
pkgrel=2
pkgdesc="A FASTQ read simulator"
arch=('x86_64')
url='https://github.com/pratas/xs'
license=('GPL3')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('3882f88dd757bee2d44cf2393af02084c572dd490dd8cbe55925cb2788777174')

prepare() {
	cd "$pkgname-$pkgver"
	sed -i \
		-e '/CFLAGS/s/=/+=/' \
		-e '/LIBS/s/$/ $(LDFLAGS)/' \
		Makefile
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D XS -t "$pkgdir/usr/bin/"
	install -Dm644 README -t "$pkgdir/usr/share/doc/$pkgname/"
}
