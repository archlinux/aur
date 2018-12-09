# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: Drew DeVault

pkgname=mako
pkgver=1.2
pkgrel=2
license=('MIT')
pkgdesc='Lightweight notification daemon for Wayland'
makedepends=("meson" "scdoc" "wayland-protocols")
depends=(
	"cairo"
	"libsystemd"
	"pango"
	"wayland"
)
arch=("x86_64")
url='https://mako-project.org'
source=("$pkgname-$pkgver.tar.gz::https://github.com/emersion/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('56f083e355295cf11831f4c3f54a95b04df1a352232ab24b0cd30c3255949e0f')

build() {
	arch-meson "$pkgname-$pkgver" build
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	install -Dm644 "$pkgname-$pkgver/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
