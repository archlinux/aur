# Maintainer: Michal Vlasák <lahcim8@gmail.com>

pkgname=mmtex
pkgdesc="A minimal modern (Lua)TeX distribution"
pkgver=20231121
pkgrel=1
url="https://github.com/vlasakm/$pkgname"
license=(custom)
arch=(x86_64)
makedepends=(meson)
depends=(zziplib libpng zlib otf-latin-modern otf-latinmodern-math)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('14b56971bdc35f01f873f9704b5be9a3cbaff57394fb6a95d6739aca8d83baab')

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
