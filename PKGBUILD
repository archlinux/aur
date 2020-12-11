# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.3
pkgrel=1
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha512sums=('cc54e0726b2a934d14ad591c7a199474b49885e6122399b282e9289610d26f3c55b3d68a7d655d88a0ff8de1a0ac0994e868fa06ae1198416aaf857a099181f1')

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
