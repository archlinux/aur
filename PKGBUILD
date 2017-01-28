# Maintainer: Devin J. Pohly <djpohly+arch@gmail.com>
pkgname=x11-touchscreen-calibrator-git
_basename=${pkgname%-git}
pkgver=0.2.r12.g74023d6
pkgrel=1
pkgdesc="X Window System Touchscreen Calibrator"
arch=('i686' 'x86_64')
url="https://github.com/djpohly/x11-touchscreen-calibrator"
license=('GPL')
depends=('libxi' 'libxrandr')
source=("git+https://github.com/djpohly/$_basename.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_basename"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_basename"
	autoreconf -if
	./configure --prefix=/usr --sysconfdir=/etc
	make
}

package() {
	cd "$_basename"
	make DESTDIR="$pkgdir/" install
}
