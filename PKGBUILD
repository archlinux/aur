# Maintainer: Ícar N. S. <personal@icarns.xyz>
pkgname=gstreamer-gtuber-git
pkgver=r211.53a21a2
pkgrel=1
pkgdesc="A C library to fetch media info from websites."
arch=(any)
url="https://github.com/Rafostar/gtuber"
license=('LGPL')
# When gstreamer 1.20.x is released, depend on non-git packages.
depends=('glib2' 'glibc' 'gobject-introspection' 'libsoup' 'gstreamer-git' 'gst-plugins-base-git' 'json-glib' 'gtk-doc')
makedepends=('git' 'gcc' 'meson' 'vala')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('gstreamer-gtuber::git+https://github.com/Rafostar/gtuber.git#branch=main')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname%-git}"
    arch-meson . build
    meson compile -C build
}

package() {
	cd "$srcdir/${pkgname%-git}"
    meson install -C build --destdir "$pkgdir"	
}
