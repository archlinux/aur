# Maintainer: Azat Abdullin <abdullin@kspt.icc.spbstu.ru>
pkgname=settings-phonepi
pkgver=1
pkgrel=7
pkgdesc="Settings application for PhonePi project"
url="https://gitlab.com/PhonePi"
arch=("i686" "x86_64" "armv6h")
license=("GPL2")
makedepends=("git" "cmake")
depends=("qt5-base" "qt5-tools" "qt5-wayland" "qt5-x11extras")
source=('git+https://gitlab.com/PhonePi/Phone')
sha256sums=("SKIP")

build() {
	cd "$srcdir/Phone/src/settings-app"
	cmake . -DCMAKE_INSTALL_PREFIX=/usr
	make
}

package() {
	cd "$srcdir/Phone/src/settings-app"
	make DESTDIR=$pkgdir install
	install -Dm600 --owner=$USER "./entry/settings-pi.desktop" "$pkgdir/$HOME/.local/share/applications/settings-pi.desktop"
	install -Dm600 --owner=$USER "./entry/settings-pi.png" "$pkgdir/$HOME/.local/share/icons/settings-pi.png"
}
