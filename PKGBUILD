# Maintainer: Ilya Elenskiy <elenskiy.ilya[@]gmail[.]com>
# Contributor: Sergey Marochkin <me@ziggi.org>

pkgname=comedilib
pkgver=0.11.0
pkgrel=1
pkgdesc="Comedi is the kernel-level driver code. Comedilib is the user-level API library code. This package does not include python bindings."
arch=('i686' 'x86_64')
url="http://comedi.org/"
license=('GPL')
groups=('devel')
depends=()
source=("http://www.comedi.org/download/comedilib-$pkgver.tar.gz")
sha512sums=('bebf24161d145d077498db91e4fac92a962c33c6b7dce3e19b68b32814e44aafdf6b5f8f9c0dd5fdbf5cbbe3b150498bbe08c9307503e4c7be5e7699a68e1b34')

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure \
		--host=$arch \
		--prefix=/usr \
		--mandir=\$${prefix}/usr/share/man \
		--datadir=\$${prefix}/usr/share/doc/ \
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
