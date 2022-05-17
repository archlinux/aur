# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=libratify-git
pkgver=v2.0.0.r0.debe81d
pkgrel=1
pkgdesc="RTF serialization and deserialization for GtkTextBuffer"
arch=(x86_64)
url="https://github.com/ptomato/ratify.git"
license=('LGPL3')
depends=('gtk3')
makedepends=('git' 'ninja' 'meson')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("libratify::git+${url}")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson build
	ninja -C build
}

package() {
cd "$srcdir/${pkgname%-git}"
meson install -C build --destdir "$pkgdir"
}
