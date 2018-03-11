# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.0
pkgrel=6
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("$pkgname-$pkgver::https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha512sums=('bd7e8ecff962d8ac3072f3f1fa7a5d9981e2da28b38a1f234f6fe550511c3fbda2c1c6e9a6d1120bf99ef3ae621a91ff67c451eaf98dfa1264e9e6a59ae55e08')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/sbin/bin/" Makefile
}

build() {
	export amdgpu=1
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
