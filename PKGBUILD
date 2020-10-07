# Maintainer: AwesomeHaircut <jesusbalbastro@gmail.com>

pkgname=touchegg
pkgver=2.0.1
pkgrel=2
pkgdesc="Multitouch gesture recognizer"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxrandr' 'libxtst' 'pugixml')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(SKIP)
build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {

	make -C build DESTDIR="$pkgdir" install

	[ -d "$pkgdir/lib" ] && mv "$pkgdir/lib" "$pkgdir/usr/lib"
}
