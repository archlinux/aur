# Maintainer: Daichi Shinozaki <dsdseg@gmail.com>
pkgname=disque
_pkgver_minor=-rc1
pkgver="1.0${_pkgver_minor/-/}"
pkgrel=1
pkgdesc="An in-memory, distributed job queue"
arch=(i686 x86_64)
url="https://github.com/antirez/disque"
checkdepends=('tcl')
backup=("etc/$pkgname.conf")
license=('GPL')
source=("https://github.com/antirez/$pkgname/archive/${pkgver/rc/-rc}.tar.gz")
md5sums=('7a39d71cdc6c4c21a1f931b0d91eacfa')

build() {
	cd "$pkgname-${pkgver/rc/-rc}"
	make 
}

check() {
	cd "$pkgname-${pkgver/rc/-rc}"
	make test
}

package() {
	cd "$pkgname-${pkgver/rc/-rc}"
	mkdir -p "$pkgdir/usr"
	make PREFIX="$pkgdir/usr" install
	install -Dm644 $pkgname.conf "$pkgdir/etc/$pkgname.conf"
}
