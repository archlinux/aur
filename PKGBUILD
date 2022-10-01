# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Tristan Porteries <tristan.porteries@gmail.com>
pkgname=dxfplotter
pkgver=1.3.3
pkgrel=1
pkgdesc="Fast and easy to use DXF to GCode converter for laser and router CNC"
arch=("any")
url="https://github.com/panzergame/dxfplotter"
license=("MIT")
makedepends=(git cmake make qt5-base qt5-svg python python-jinja)
provides=("dxfplotter")
source=("$pkgname-$pkgver::git+https://github.com/panzergame/$pkgname.git#tag=v${pkgver}")
md5sums=('SKIP')

prepare() {
	cd "$pkgname-$pkgver"
	git submodule init
	git submodule update
}

build() {
	cd "$pkgname-$pkgver"
	cmake -DBUILD_TESTING=OFF -S .
	cmake --build . --target $pkgname
}

package() {
	cd "$pkgname-$pkgver"
	cmake --install . --prefix $pkgdir
}
