# Maintainer: Sergey Marochkin <me@ziggi.org>

pkgname=comedilib
pkgver=0.10.2
pkgrel=1
pkgdesc="Comedi is the kernel-level driver code. Comedilib is the user-level API library code."
arch=('i686' 'x86_64')
url="http://comedi.org/"
license=('GPL')
groups=('devel')
depends=()
source=("http://www.comedi.org/download/comedilib-$pkgver.tar.gz")
sha512sums=('8adf52001e997e38a685d87db60d5814d43b49be0c76c03ad8b5672ff84945cb8f0f2ff9d69c33d8a08d54c6a9adb50dee683b679e4036a5d6398d2d8f6878ec')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure \
		--host=$arch \
		--prefix=/usr \
		--mandir=\$${prefix}/share/man \
		--datadir=\$${prefix}/share/doc/ \
		--sysconfdir=/etc \
		--disable-firmware \
		--localstatedir=/var \
		--disable-dependency-tracking \
		--disable-python-binding \
		--disable-ruby-binding \
		--with-pdf-backend=no\
		--with-gnu-ld

	make
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir/" install

	mv ${pkgdir}/usr/sbin ${pkgdir}/usr/bin
}
