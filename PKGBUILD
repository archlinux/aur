# Maintainer: jzbor <zborof at posteo dot de>
# This is an adjusted version of aur/touchegg which is maintained by:
# AwesomeHaircut <jesusbalbastro@gmail.com>
# jbouter <aur@kn0x.org>

_pkgname=touchegg
pkgname=touchegg-nosystemd
pkgver=2.0.11
pkgrel=1
pkgdesc="Multitouch gesture recognizer (with systemd support disabled)"
arch=('i686' 'x86_64')
url="https://github.com/JoseExposito/touchegg/"
license=('GPL3')
depends=('libinput' 'cairo' 'libx11' 'libxi' 'libxrandr' 'libxtst' 'pugixml' 'gtk3' 'glib2')
makedepends=('cmake')
provides=('touchegg')
conflicts=('touchegg')
# Workaround until 2.0.10
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha512sums=(ba75a42110a3d2bf482a433fbfdb85f17cbd55332a21d58b62605f5f0211ccfd9cdf3651734f0d225adf6593a8ed92d8c886c164153b28c7a702c3f80ae80909)

build() {
	cmake -B build -S "$_pkgname-$pkgver" \
        -DUSE_SYSTEMD=OFF \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-Wno-dev
	make -C build
}

package() {

	make -C build DESTDIR="$pkgdir" install

	[ -d "$pkgdir/lib" ] && mv "$pkgdir/lib" "$pkgdir/usr/lib"

	install -Dm644 "$srcdir/$_pkgname-$pkgver/installation/touchegg.desktop" "$pkgdir/etc/xdg/autostart/touchegg.desktop"
}

