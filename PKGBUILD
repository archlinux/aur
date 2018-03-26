# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.1
pkgrel=1
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("$pkgname-$pkgver.tar.gz::https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha512sums=('abf4e51582cc668e1abbcd87bfa6ec5f16a301c3327a276a6f27fe928f780acf1442a696bb00bdbd3e8cad21a1416ffcf500a865dd4bac9517fac1a43d851c5a')

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
