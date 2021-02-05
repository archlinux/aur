# Maintainer: Antoine Viallon <antoine.viallon@gmail.com>

pkgname=knightos-kcc-git
_pkgname=kcc
pkgver=4.0.0.r5.gefd439995
pkgrel=2
license=('GPL')
pkgdesc='A C compiler for z80 systems'
groups=("knightos")
depends=("scas" "boost")
makedepends=("cmake" "asciidoc")
arch=("x86_64")
url='https://github.com/KnightOS/kcc'
source=("${_pkgname}::git+https://github.com/KnightOS/kcc")
sha256sums=('SKIP')
provides=("knightos-kcc")
conflicts=("knightos-kcc")

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgname"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$_pkgname"
	DESTDIR="$pkgdir/" make install
}
