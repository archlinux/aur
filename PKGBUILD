# Maintainer: ntwk <rnndxb@gmail.com>

pkgname=bdfresize
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="A command to scale fonts in Bitmap Distribution Format"
arch=('i686' 'x86_64')
url="http://openlab.ring.gr.jp/efont"
license=('GPL')
source=("$url/dist/tools/$pkgname/$pkgname-$pkgver.tar.gz"
        "010_ftbfs-gcc4.patch"
        "020_minus-sign.patch")
sha256sums=('440cfc0620a0237e46352c14a0774caa3f3059759b0a20defefc94e8490897a6'
            'b2bfe278b5719ce8b946e20372d4a8d4c6630eeb74c0212c1c454911676ecbd9'
            'ee1032245a87e6821d83cfff5230585ba707f307263a56b20f0f3672686832c1')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "../010_ftbfs-gcc4.patch"
        patch -p1 -i "../020_minus-sign.patch"
	autoreconf -vfi
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
