# Maintainer: Gaël PORTAY <gael.portay@gmail.com>

pkgname=iamroot
pkgver=2
pkgrel=1
pkgdesc='Emulating syscall chroot in an unpriviliged process'
arch=('x86_64')
url="https://github.com/gportay/$pkgname"
license=('GPL')
makedepends=('asciidoctor')
source=("https://github.com/gportay/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('53c0dbe9f4cce563af4ab7116c7aa9889801d9c5b82881bb1ec04e9f99b2a8a8')

build() {
	cd "$pkgname-$pkgver"
	make CFLAGS= libiamroot.so doc
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make install PREFIX=/usr DESTDIR="$pkgdir"
	install -D -m755 exec.sh "$pkgdir/usr/lib/iamroot/exec.sh"
}
