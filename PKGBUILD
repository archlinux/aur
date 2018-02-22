# Maintainer: b10n <b10n@dittes.nl>
pkgname=powermate-git
pkgver=v5.r8.gc6ff4c1
pkgrel=1
pkgdesc="A small Linux userspace driver for the Griffin PowerMate."
arch=('x86_64')
url="https://github.com/stefansundin/powermate-linux"
license=('GPL3')
depends=('libpulse')
makedepends=('libnotify')
source=("git+https://github.com/stefansundin/powermate-linux.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/powermate-linux"
	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/powermate-linux"
	make
}

package() {
	cd "$srcdir/powermate-linux"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/udev/rules.d"
	cp powermate "$pkgdir/usr/bin"
	cp 60-powermate.rules "$pkgdir/etc/udev/rules.d"
}
