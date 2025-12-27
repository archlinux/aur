# Maintainer: not_anonymous <nmlibertarian@gmail.com>
# Contributor: Anthony DeStefano <adx@fastmail.fm> 

pkgname=flrig
pkgver=2.0.10
pkgrel=1
pkgdesc="Amateur (Ham) Radio Transceiver Control Program"
arch=('armv7h' 'i686' 'x86_64' 'aarch64')
url="http://www.w1hkj.com/flrig-help/index.html"
license=('GPL-2.0-or-later')
depends=('fltk<1.5' 'systemd-libs' 'flxmlrpc>=1.0.1' 'libgpiod' 'hamradio-menus')
optdepends=('fldigi: for digital mode interface')
makedepends=('autoconf' 'automake' 'pkg-config')
provides=('flrig')
conflicts=('flrig-git')
source=(https://downloads.sourceforge.net/project/fldigi/$pkgname/$pkgname-$pkgver.tar.gz
	diff.wayland.fix)

prepare() {
	cd $srcdir/$pkgname-$pkgver

	patch -p0 < ../diff.wayland.fix

	autoreconf -i
}

build() {
	cd $srcdir/$pkgname-$pkgver

	./configure --prefix=/usr
}

check() {
	cd $srcdir/$pkgname-$pkgver

	make -k check
}

package() {
	cd $srcdir/$pkgname-$pkgver

	make DESTDIR="$pkgdir" install
}
md5sums=('1a7a91f7f60ca8c5b19ccc6bfa13595a'
         '1149f6b6f5869a900cb620d8fdd23b61')
sha256sums=('6a5f2b87d4fffed410a35b3a176b5d04e60ed4de3fda545079f3656e42ef42bd'
            '4c548676aedc35ede53ad9e81184fe2d75f5f536f3716454ac3c97d4b8604b19')
