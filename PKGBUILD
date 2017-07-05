# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=blocks-phonepi
pkgver=1
pkgrel=4
pkgdesc="Screen block/unblock applications for PhonePi project"
url="https://github.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-wayland" "qt5-x11extras")
source=(git://github.com/PhonePi/phonepi.git)
sha256sums=("SKIP")

build() {
	cd "$srcdir/phonepi/src/block-apps"
	git submodule init
	git submodule update

	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/phonepi/src/block-apps"
	make DESTDIR=$pkgdir install
	install -Dm600 --owner=$USER "./unblock/config.ini" "$pkgdir/$HOME/.config/unblock-pi"
}
