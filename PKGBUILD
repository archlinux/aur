# Maintainer: Deposite Pirate <dpirate at metalpunks dot info>
#
# Previous maintainers:
#   Johannes Maibaum <jmaibaum at gmail dot com>
#
# Upstream: https://git.metalpunks.info/arch-ports

pkgname=parzip
pkgver=1.3.0
pkgrel=2
pkgdesc="A command line utility to pack and unpack zip archives using multiple threads."
license=('GPL3')
arch=('x86_64')
depends=('xz' 'zlib')
makedepends=('meson')
url="https://github.com/jpakkane/parzip"
source=("https://github.com/jpakkane/${pkgname}/releases/download/${pkgver}/${pkgname}-${pkgver}.zip")
sha256sums=('2497305ce36d3b6225d9517fa5d4c408adef3935f5f736174e218f971caeb7bb')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	meson --prefix=/usr build
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
