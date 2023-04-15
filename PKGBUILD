# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Previous maintainers:
#   Johannes Maibaum <jmaibaum at gmail dot com>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=parzip
pkgver=1.4.0
pkgrel=1
pkgdesc="A command line utility to pack and unpack zip archives using multiple threads."
license=('GPL3')
arch=('x86_64')
depends=('xz' 'zlib')
makedepends=('meson')
url="https://github.com/jpakkane/parzip"
source=("https://github.com/jpakkane/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('99cd404e42f6ecfa0e94c0c2d33710e648bd23d1fede7de7232f3e792b2ad8f1')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson setup --prefix=/usr build
	ninja -C build
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	ninja -C build test
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	DESTDIR="$pkgdir" meson install -C build
}
