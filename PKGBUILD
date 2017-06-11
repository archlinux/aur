# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.0
pkgrel=5
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("${pkgname}-${pkgver}::https://github.com/clbr/radeontop.git#tag=v$pkgver")
sha256sums=('bb82bca498a62fb6706d273feb55860bca6627e3497d66f4435d0fba969d48ae')

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
