# Maintainer: Michal Vlasák <lahcim8@gmail.com>

pkgname=mmtex
pkgdesc="A minimal modern (Lua)TeX distribution"
pkgver=20220311
pkgrel=1
url="https://github.com/vlasakm/$pkgname"
license=(custom)
arch=(x86_64)
makedepends=(meson)
depends=(zziplib libpng zlib otf-latin-modern otf-latinmodern-math)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('10809823f9e6a0d6027d1652d7ec50fbeaf3c659ac99a951c53e7ed11e09454c')

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
