# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Muflone http://www.muflone.com/contacts/english/
# Contributor: Giuseppe Calà <jiveaxe@gmail.com>
pkgname=pacmanlogviewer-git
pkgver=1.4.2.r0.g4271be3
pkgrel=1
pkgdesc="Inspect pacman log files"
arch=('x86_64')
url="https://opendesktop.org/content/show.php?content=150484"
license=('GPL')
depends=('qt5-base' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'qt5-tools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/gcala/pacmanlogviewer.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cmake -S . \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DBUILD_WITH_QT5=ON \
		-Wno-dev
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
