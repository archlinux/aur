# Maintainer: Martin Sobotka <sobotkama@sobotkama.eu>
pkgname=qtmips
pkgver=0.7.5
pkgrel=1
pkgdesc="MIPS CPU simulator for education purposes with pipeline and cache visualization"
arch=("x86_64")
url="https://github.com/cvut/QtMips"
license=('GPL')
depends=("qt5-base")
makedepends=("qt5-tools" "elfutils")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/cvut/QtMips/archive/v${pkgver}.tar.gz")
md5sums=("4b9ae801fbccbd66e8cf32a226d898f4")

prepare() {
	cd "$srcdir/QtMips-$pkgver"
	mkdir build
}

build() {
	cd "$srcdir/QtMips-$pkgver/build"
	qmake .. "QMAKE_RPATHDIR += ../qtmips_machine ../qtmips_osemu"
	make
}

package() {
	cd "$srcdir/QtMips-$pkgver/build"
	install -Dm755 "qtmips_gui/qtmips_gui" "$pkgdir/usr/bin/qtmips_gui"
	install -Dm755 "qtmips_cli/qtmips_cli" "$pkgdir/usr/bin/qtmips_cli"
}
