# Maintainer: Sebastian Bøe <sebastianbooe@gmail.com>
pkgname=icestorm-git
pkgver=r130.745d81d
pkgrel=1
pkgdesc="Lattice iCE40 FPGAs Bitstream Documentation (Reverse Engineered)"
arch=('x86_64')
url="http://www.clifford.at/icestorm/"
license=('custom:ISC')
depends=('python' 'libftdi-compat')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/cliffordwolf/icestorm.git')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    make
}

package() {
	cd "$srcdir/${pkgname%-git}"

	# Move the license file into place
	install -dm 755 "$pkgdir/usr/share/licenses/$pkgname"
	install -m 644 README "$pkgdir/usr/share/licenses/$pkgname"

	# Install the package
	make DESTDIR="$pkgdir/usr" install
}
