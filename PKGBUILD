# Maintainer: Angelo Dalzotto <angelodalzotto97 at gmail dot com>
pkgname=asrrgb
pkgver=1.1.0
pkgrel=1
pkgdesc="Control ASRock's B550 and TRX40 motherboard series RGB LEDs"
arch=('x86_64')
url="https://github.com/aedalzotto/asrrgb"
license=('GPL2')
provides=('asrrgb-bin')
conflicts=('asrrgb-bin')
source=("https://github.com/aedalzotto/asrrgb/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('40773060e6a9d379d270b80b012c3230ff74dfb0ac9213f36a24af8b5df2e0d3')
makedepends=(
	'boost'
	'meson'
	'ninja'
)
depends=(
	'boost-libs'
	'libusb'
)

prepare() {
	meson setup --prefix / --buildtype=plain $srcdir/$pkgname-$pkgver $srcdir/$pkgname-$pkgver/build
}

build() {
	meson compile -C $srcdir/$pkgname-$pkgver/build
}

package() {
	meson install -C $srcdir/$pkgname-$pkgver/build --destdir "$pkgdir"
}
