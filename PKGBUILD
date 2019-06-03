# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.2
pkgrel=1
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha512sums=('f36c2e418fe8add77080642e575b99c092afeda24811f33ee161a8c9341decb611f631e5511a5255089d63e172eda6836295e5795c3ebd3f5cad172f7599d862')

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
