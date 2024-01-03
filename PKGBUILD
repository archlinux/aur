# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=libeconf
pkgver=0.6.0
pkgrel=1
pkgdesc="Enhanced config file parser, which merges config files placed in several locations into one."
arch=(x86_64)
url="https://opensuse.github.io/libeconf/"
license=('MIT')
depends=()
makedepends=(meson)
source=("$pkgname-$pkgver.tar.gz::https://github.com/openSUSE/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz"
	"https://github.com/openSUSE/libeconf/commit/1eef99e3144811c0acf905bb2e67a78633ee6eaf.patch")
sha256sums=('766da6c606e33d9bc8ff0a4f4b72ce11a236d6cb046f21ebb9c4c6a9d078fff2'
            '516761a2d64958f0845eee14bb61cf665f2c0bc139b97491673aee04276ce177')

prepare() {
	cd "$pkgname-$pkgver"

	patch -p1 < "$srcdir"/1eef99e3144811c0acf905bb2e67a78633ee6eaf.patch
}

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
