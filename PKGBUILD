# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=disk-utilities-git
pkgver=r820.d29a044
pkgrel=1
pkgdesc="Collection of utilities for ripping, dumping, analysing, and modifying disk images"
arch=('x86_64')
url="https://github.com/keirf/disk-utilities"
license=('Unlicense')
depends=()
makedepends=('git' 'capsimage')
optdepends=('capsimage: Support for IPF and CT Raw files')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/keirf/disk-utilities.git')
sha256sums=('SKIP')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	caps=y make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	caps=y make DESTDIR="$pkgdir/" PREFIX=/usr install
}
