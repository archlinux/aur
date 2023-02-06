# Maintainer: AwesomeHaircut <jesusbalbastro@gmail.com>
# Co-Maintainer: jbouter <aur@kn0x.org>

pkgname=touchegg
pkgver=2.0.16
pkgrel=1
pkgdesc="Multitouch gesture recognizer"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3' 'glib2')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(92a5409c1f570de2690e57e8ae291bda1c07b5d5c1094fd80a9648c5986f5dc8cd5a8e03c3714a8dc10b5305a75e52a0ef86f5bf52a038db08fedb86620af76f)
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
