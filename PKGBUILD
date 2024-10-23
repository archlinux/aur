# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=semblance-git
pkgver=r200.e87c0b0
pkgrel=1
pkgdesc='Produce disassembly and other information from exectable files'
arch=('x86_64')
url='https://gitlab.winehq.org/zfigura/semblance'
license=('GPL-3.0-or-later')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://gitlab.winehq.org/zfigura/semblance.git')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/${pkgname%-git}"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 dump "$pkgdir/usr/bin/semblance-dump"
}
