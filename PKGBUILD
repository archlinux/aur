# Maintainer: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributpr: felix.s <felix.von.s@posteo.de>

pkgname=weborf
pkgver=0.15
pkgrel=1
pkgdesc="Minimal HTTP server to share your files"
arch=('i686' 'x86_64' 'armv7h' 'armv6h' 'aarch64')
url='https://ltworf.github.io/weborf/'
license=(GPL3)
makedepends=('findutils')
source=(https://github.com/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('c77388253f7513fcabd74900cd8cd28623478c6ced6cd3b06994c4eb3f60e9a3')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
	cd "$pkgdir"
	find lib -type f -exec install -D {} usr/{} \;
	rm -r lib
}
