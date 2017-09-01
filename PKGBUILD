# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=desktop-phonepi
pkgver=1
pkgrel=8
pkgdesc="Desktop application for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-wayland")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/desktop"
	git submodule init
	git submodule update
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/Phone/src/desktop"
	make DESTDIR=$pkgdir install
	install -Dm600 --owner=$USER "./config.ini" "$pkgdir/$HOME/.config/desktop-pi"
	install -Dm666 "./resourses/background.png" "$pkgdir/usr/share/desktop-pi/background.png"
	install -Dm644 "./phonepi.desktop" "$pkgdir/usr/share/wayland-sessions/phonepi.desktop"
}
