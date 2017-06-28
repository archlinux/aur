pkgname=settings-phonepi
pkgver=1
pkgrel=4
pkgdesc="Settings application for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-wayland")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/settings-app"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/phonepi/src/settings-app"
	make DESTDIR=$pkgdir install
	install -Dm600 --owner=$USER "./entry/settings-pi.desktop" "$pkgdir/$HOME/.local/share/applications/settings-pi.desktop"
	install -Dm600 --owner=$USER "./entry/settings-pi.png" "$pkgdir/$HOME/.local/share/icons/settings-pi.png"
}
