# Maintainer: Omar Sandoval <osandov at osandov dot com>

pkgname=libkdumpfile-git
pkgver=0.3.0.r271.gb11f14f
pkgrel=1
pkgdesc='Library for kernel core dump file access (git version)'
arch=('x86_64')
url='https://github.com/ptesarik/libkdumpfile'
license=('GPL')
depends=('lzo' 'snappy' 'zlib')
makedepends=('git')
provides=('libkdumpfile')
source=("$pkgname::git+https://github.com/ptesarik/libkdumpfile")
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	autoreconf -fi
	./configure --prefix=/usr --without-python
	make
}

check() {
	cd "$pkgname"
	make check
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir" install
}
