# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libeconf
pkgver=0.4.9
pkgrel=1
pkgdesc="Enhanced config file parser, which merges config files placed in several locations into one."
arch=(x86_64)
url="https://opensuse.github.io/libeconf/"
license=('MIT')
depends=()
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
md5sums=('c2523f6987c436a44b92917a028cbf7c')

build() {
	cd "$pkgname-$pkgver"

	arch-meson build
	meson compile -C build
}

check() {
	cd "$pkgname-$pkgver"

	meson test -C build --print-errorlogs
}

package() {
	cd "$pkgname-$pkgver"

	meson install -C build --destdir "$pkgdir"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
