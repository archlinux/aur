pkgname=multicast-mtools
pkgver=2.3
_pkgrev=db665a4303c38cee908eba4dac50873c3f1d899c
pkgrel=1
pkgdesc="Tools for multicast testing (msend and mreceive)"
url="https://github.com/troglobit/mtools"
arch=(i686 x86_64)
source=("git+https://github.com/troglobit/mtools.git#commit=$_pkgrev")
sha256sums=('SKIP')

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
