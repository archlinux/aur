# Maintainer: Arvid Norlander <VorpalBlade (at) users DOT noreply DOT github DOT com>
pkgname=disk-utilities-git
pkgver=r818.28b3ee8
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
source=('git+https://github.com/keirf/disk-utilities.git'
        '01-ldflags.patch')
sha256sums=('SKIP'
            'ff9ad3fda44a1480b7c82bd0597473dabd9628eceaae375b6e601aa9fba975e2')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"
	patch -p1 -i "$srcdir/01-ldflags.patch"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	caps=y make PREFIX=/usr
}

package() {
	cd "$srcdir/${pkgname%-git}"
	# Eww...
	caps=y make PREFIX="$pkgdir/usr" install
}
