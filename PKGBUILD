# Maintainer: AwesomeHaircut <jesusbalbastro@gmail.com>

pkgname=touchegg
pkgver=2.0.5
pkgrel=0
pkgdesc="Multitouch gesture recognizer"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(4534afd1aa5cbb50fe674491294635eb8b14e410bb834a2af095f1fe5e9bf0cc01860ee2916fd25ce5e7566bbb900d54735e038429b367490f189b9ada21ba09)
build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {

	make -C build DESTDIR="$pkgdir" install

	[ -d "$pkgdir/lib" ] && mv "$pkgdir/lib" "$pkgdir/usr/lib"

	install -Dm644 "$srcdir/$pkgname-$pkgver/installation/touchegg.desktop" "$pkgdir/etc/xdg/autostart/touchegg.desktop"
}
