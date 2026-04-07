pkgname=openpace
pkgver=1.1.4
pkgrel=1
pkgdesc="Cryptographic library for EAC version 2"
arch=(x86_64)
url="https://frankmorgner.github.io/openpace"
license=(LGPL-3.0)
depends=(openssl)
makedepends=(
	autoconf
	gengetopt
	git
	help2man
	libtool
	make
)
source=("git+https://github.com/frankmorgner/openpace.git#tag=1.1.4")
sha256sums=('6d4eddae736f169ff0666e54e533953f4a62a5721da21879117e24861961ee99')

prepare() {
	cd $pkgname
	autoreconf -fi
}

build() {
	cd $pkgname
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd $pkgname
	make DESTDIR="$pkgdir" install
	mv "$pkgdir"/usr/bin/example "$pkgdir"/usr/share/doc/openpace/
}
