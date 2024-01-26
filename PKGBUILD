# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: nullcoder

pkgname=wmenu
pkgver=0.1.6
pkgrel=1
pkgdesc="Efficient dynamic menu for Wayland and wlroots based Wayland compositors"
arch=('x86_64')
url="https://git.sr.ht/~adnano/wmenu"
license=('MIT')
makedepends=(
	'meson'
	'ninja'
	'scdoc'
	'wayland-protocols'
)
depends=(
	'libcairo.so'
	'libxkbcommon.so'
	'libpango-1.0.so'
	'libwayland-client.so'
)
source=(
	"$pkgname-$pkgver.tar.gz::https://git.sr.ht/~adnano/wmenu/archive/$pkgver.tar.gz"
)
b2sums=('f624773e29c751cb0d890d428482019bab35af1d3f540a53233307d30955dd5936a3eab483be7dac471aab6a85a4cd1953d9a75f095130316a13f96684d52477')

build() {
	cd "$pkgname-$pkgver"
	arch-meson build
	ninja -C build
}

package() {
	cd "$pkgname-$pkgver"
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

