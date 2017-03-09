# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>

pkgname=flowd-git
pkgver=0.9.1.r13.gb1040e1
pkgrel=1
pkgdesc="small, fast and secure NetFlow collector"
arch=(i686 x86_64)
url="http://www.mindrot.org/projects/flowd/"
license=('custom')
makedepends=('git' 'byacc')
source=("git://github.com/djmdjm/flowd")
md5sums=(SKIP)

backup=('etc/flowd.conf')

function pkgver() {
	cd flowd

	git describe --long --tags | sed 's/^FLOWD_//;s/_/./g;s/-/.r/;s/-/./'
}


build() {
	cd flowd

	autoreconf
	./configure \
		--prefix=/usr \
		--sysconfdir=/etc \
		--sbindir=/usr/bin
	make
}

package() {
	cd flowd

	make DESTDIR="$pkgdir" install
	install -Dm644 LICENSE \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
