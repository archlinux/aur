# Maintainer: dokutan <dokutan at tutanota dot com>
# Contributor: nyanpasu64 <nyanpasu64 at tuta dot io>
pkgname=rgb_keyboard-git
_pkgbare="${pkgname%-git}"
pkgver=0.2.r1.g28611e0
pkgrel=1
pkgdesc="Controls the RGB lighting on some keyboards (GMMK and others)."
arch=(x86_64)
url="https://github.com/dokutan/rgb_keyboard"
license=('GPL3')
depends=('libusb' 'gcc-libs')
makedepends=('git')
provides=("$_pkgbare")
conflicts=("$_pkgbare")
source=("git+https://github.com/dokutan/rgb_keyboard.git")
sha256sums=('SKIP')

pkgver() {
	cd "$_pkgbare"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$_pkgbare"
	make
}

package() {
	cd "$_pkgbare"

	mkdir -p $pkgdir/usr/bin \
		$pkgdir/usr/share/man/man1 \
		$pkgdir/usr/share/doc/rgb_keyboard \
		$pkgdir/etc/udev/rules.d

	cp ./rgb_keyboard $pkgdir/usr/bin/rgb_keyboard && \
	cp ./keyboard.rules $pkgdir/etc/udev/rules.d && \
	cp ./examples/* $pkgdir/usr/share/doc/rgb_keyboard/ && \
	cp ./README.md $pkgdir/usr/share/doc/rgb_keyboard/ && \
	cp ./rgb_keyboard.1 $pkgdir/usr/share/man/man1/
}
