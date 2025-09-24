pkgname=multicast-mtools
pkgver=3.2
pkgrel=1
pkgdesc="Tools for multicast testing (msend and mreceive)"
url="https://github.com/troglobit/mtools"
arch=(i686 x86_64)
source=("git+https://github.com/troglobit/mtools.git#tag=v$pkgver")
sha256sums=('65a06e768653272533e4701938edd4655aa9c75819181cf9fbece99a8d1f1c61')

pkgver() {
	cd "$srcdir/mtools"
	git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
}

prepare() {
	cd "$srcdir/mtools"
	sed -i "s|/sbin|/bin|g" Makefile
}

build() {
	cd "$srcdir/mtools"
	make prefix=/usr
}

package() {
	cd "$srcdir/mtools"
	make prefix=/usr DESTDIR="$pkgdir" install
}
