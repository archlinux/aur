# Maintainer: Michal Vlasák <lahcim8@gmail.com>

pkgname=mmtex
pkgdesc="A minimal modern (Lua)TeX distribution"
pkgver=20220210
pkgrel=1
url="https://github.com/vlasakm/$pkgname"
license=(custom)
arch=(x86_64)
makedepends=(meson)
depends=(zziplib libpng zlib otf-latin-modern otf-latinmodern-math)
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")

sha256sums=('f2081a289663b6fb92ef589fdcccf4dbb4a3f08d48ed8da5397a967c58533716')

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
