# Maintainer: AwesomeHaircut <jesusbalbastro@gmail.com>

pkgname=touchegg
pkgver=2.0.4
pkgrel=6
pkgdesc="Multitouch gesture recognizer"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'systemd-libs' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(f0498cd4e58b0e9e3d2dc15677673c939dc818a8720626268e2fba1bc0abb2ee54deb4abcb47e230ba3b201463eef245e180858e46548b58b062c4d72a2199c5)
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
