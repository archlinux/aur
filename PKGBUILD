# Maintainer: Ethan Cheng <ethan@nijika.org>
pkgname='zwc-git'
pkgver=0.1.1.r3.gfe99965
pkgrel=1
pkgdesc="Encodes/decodes data into zero-width utf-8 characters"
arch=(any)
url="https://github.com/yadayadajaychan/zwc"
license=('GPL3')
makedepends=('git' 'go' 'make')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")

source=(git+$url.git?signed#branch=testing)
cksums=('SKIP')
validpgpkeys=(1624691AAB618B49D8AE10BE046F1347562492CC)

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$srcdir/${pkgname%-git}"
	make
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir" PREFIX=/usr install
}
