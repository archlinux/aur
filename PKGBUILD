# Maintainer: Edmund Lodewijks <e.lodewijks@gmail.com>
# Contributor: Gromit <gromit@archlinux.org>

pkgname=gnucobol
pkgver=3.2
pkgdesc="A free, open source and modern COBOL compiler"
pkgrel=2
arch=("x86_64")
url="https://www.gnu.org/software/gnucobol/"
license=("GPL-3.0-only")
depends=("db" "gmp" "json-c" "libxml2" "ncurses" "glibc" "bash")
makedepends=("gcc")
options=("!libtool")
source=(
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz"
	"https://ftp.gnu.org/gnu/gnucobol/$pkgname-$pkgver.tar.xz.sig"
)
sha256sums=('3bb48af46ced4779facf41fdc2ee60e4ccb86eaa99d010b36685315df39c2ee2'
            'SKIP')
validpgpkeys=(
	"B9459D0CA8A740B323235CDF13E96B53C005604E"
)

build() {
	cd "$srcdir/$pkgname-$pkgver"

	# Until fixed, the following CFLAG is added:
	CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration" ./configure --prefix=/usr --infodir=/usr/share/info
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}

