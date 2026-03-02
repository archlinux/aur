# Maintainer: tPenguinLTG <tpenguinltg at disroot dot org>
pkgname=se
pkgver=3.0.1
pkgrel=2
pkgdesc="A screen oriented version of the classic UNIX text editor ed"
arch=('i686' 'x86_64')
url="http://se-editor.org/"
license=('custom:public domain')
depends=('ncurses')
source=("http://se-editor.org/dist/$pkgname-$pkgver.tar.gz"
        "strict-prototypes.patch")
md5sums=('1591fbb514729f846a4f12bdc45ee600'
         '9d2147cdfae71f7a114fb0970ec2ac21')

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 <../strict-prototypes.patch
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -i
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
