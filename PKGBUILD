# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: boromil@gmail.com

pkgname=raw-thumbnailer
pkgver=0.2.1
pkgrel=7
pkgdesc="A lightweight and fast raw image thumbnailer that can be used by file managers."
url="https://code.google.com/archive/p/raw-thumbnailer/"
license=('GPL2')
arch=('x86_64')
depends=('libopenraw')
source=(https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/$pkgname/$pkgname-$pkgver.tar.gz)
sha1sums=('f34012062c0b1eaa10525722c36bd027b11ade2e')

prepare() {
	cd $pkgname-$pkgver

	# Fix build with libopenraw 0.2
	sed -ri 's/(libopenraw(-gnome)?)-1\.0/\1-0.3/' configure.ac
	autoreconf -vi
}

build() {
	cd $pkgname-$pkgver

	./configure --prefix=/usr
	make
}

package() {
	cd $pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
