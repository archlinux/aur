# Maintainer: Michal Vlasák <lahcim8@gmail.com>

pkgname=mmtex
pkgdesc="A minimal modern (Lua)TeX distribution"
pkgver=20230527
pkgrel=1
url="https://github.com/vlasakm/$pkgname"
license=(custom)
arch=(x86_64)
makedepends=(meson)
depends=(zziplib libpng zlib otf-latin-modern otf-latinmodern-math)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('e83f2e82a8c82cb67fc669b2d8a7639377ed3fffd3614d4d16c4ec1bb1f0f491')

build() {
	arch-meson "$pkgname-$pkgver" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "$pkgdir"

	cd "$pkgname-$pkgver"
	install -Dm644 -t "$pkgdir/usr/share/licenses/${pkgname%-bin}" licenses/* LICENSE*
}
