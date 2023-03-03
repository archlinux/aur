# Maintainer: silverhikari <kerrickethan@gmail.com>
pkgname=libchimara-git
pkgver=0.9.2.r17.2571f79
pkgrel=2
pkgdesc="Interactive Fiction GTK Widget"
arch=(x86_64)
url="https://chimara.github.io/Chimara/"
license=('custom')
depends=('gtk3' 'gstreamer' 'gobject-introspection' 'gst-plugins-bad' 'gst-plugins-good' 'gst-plugins-base')
makedepends=('git' 'meson' 'ninja')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("libchimara::git+https://github.com/chimara/Chimara.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	arch-meson build
	meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
	meson install -C build --destdir "$pkgdir"
	install -D "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
