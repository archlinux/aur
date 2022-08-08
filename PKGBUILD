# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Philip Goto <philip.goto@gmail.com>

pkgname=libspng-git
_pkg="${pkgname%-git}"
pkgver=0.7.2.r18.gc4126ad
pkgrel=1
pkgdesc='Simple, modern libpng alternative'
arch=('x86_64' 'aarch64')
url='https://github.com/randy408/libspng'
license=('BSD')
depends=('zlib')
makedepends=('git' 'meson')
provides=("$_pkg" "$_pkg.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	arch-meson build "$_pkg"
	meson compile -C build
}

package() {
	DESTDIR="$pkgdir" meson install -C build
	install -Dm644 "$_pkg/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
