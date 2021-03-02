# Maintainer: Markus Kitsinger (SwooshyCueb) <root@swooshalicio.us>

pkgname=libvm68k-git
pkgver=2.alpha.4.r83.gd1c38e6
pkgrel=3
pkgdesc="M68000 ISA virtual machine components implemented in C++ "
arch=('i686' 'x86_64')
depends=()
makedepends=('git' 'make' 'pkg-config')
checkdepends=('cppunit')
url="https://www.vx68k.org/vx68k"
license=('GPL3')
source=(${pkgname%-git}::git+https://bitbucket.org/kazssym/libvm68k.git)
sha256sums=('SKIP')
provides=('libvm68k')
conflicts=('libvm68k')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	gitdescr="$(git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g')"
	echo "${gitdescr##release/}"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	#autoreconf
	./configure --prefix=/usr --with-gnu-ld
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm 644 COPYING -t "$pkgdir/usr/share/licenses/libvm68k"
	make DESTDIR="$pkgdir" install
}
