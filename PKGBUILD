# Maintainer: Raymond Li <aur@raymond.li>
pkgname=sys161
pkgver=2.0.8
pkgrel=2
pkgdesc="A synthetic hardware platform designed specifically for use in CS161."
arch=('x86_64')
url="http://www.eecs.harvard.edu/~mdw/course/cs161/handouts/sys161/"
license=('custom')
source=("http://os161.eecs.harvard.edu/download/$pkgname-$pkgver.tar.gz")
md5sums=('1edad9cc363819c58d3178ed93e2fe0a')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr mipseb
	sed -i 's/uint64_t extra_selecttime/extern uint64_t extra_selecttime/' include/onsel.h
	make
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m 644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="$pkgdir/" install
}
